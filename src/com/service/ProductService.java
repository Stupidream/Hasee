package com.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressesDAO;
import com.dao.HQLDAO;
import com.dao.LversionDAO;
import com.dao.MycartDAO;
import com.dao.OrdersDAO;
import com.dao.PakagesDAO;
import com.dao.TorderDAO;
import com.pojo.Addresses;
import com.pojo.Lversion;
import com.pojo.Mycart;
import com.pojo.Orders;
import com.pojo.Pakages;
import com.pojo.Torder;
import com.pojo.Users;

@Service
public class ProductService {
	@Autowired
	private LversionDAO lDao;
	@Autowired
	private PakagesDAO pDao;
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private MycartDAO mycartDAO;
	@Autowired 
	private TorderDAO torderDAO;
	@Autowired
	private OrdersDAO ordersDAO;
	@Autowired
	private AddressService addressService;
	
	
	/**
	 * 获取产品详情信息
	 * @param vid
	 * @param uid
	 * @return
	 */
	public Map showDetail(int vid,int uid){
		String hql="from Mycollect mc where mc.lversion.id=? and mc.users.id=?";
		
		Lversion lversion=lDao.findById(vid);
		List list=pDao.findAll();
		List listCollect=hqldao.findByHQL(hql, vid,uid);
		int remark=0;
		if (listCollect.size()>0) {
			remark=1;
		}
		Map map=new HashMap();
		map.put("lversion", lversion);
		map.put("plist", list);
		map.put("remark", remark);
		return map;
	}
	
	
	/**
	 * 添加购物车
	 */
	public boolean addCart(int uid,int vid,int pid,int num){
		String hql="from Mycart mc where mc.users.id=? and mc.lversion.id=?";
		List<Mycart> list=hqldao.findByHQL(hql, uid,vid);
		
		boolean f=true;
		
		Users users=new Users();
		Lversion lversion=new Lversion();
		Pakages pakages=new Pakages();
		Mycart mycart=new Mycart();
		
		users.setId(uid);
		lversion.setId(vid);
		pakages.setId(pid);
		
		mycart.setUsers(users);
		mycart.setLversion(lversion);
		mycart.setPakages(pakages);
		if (list.size()>0) {
			int mcid=list.get(0).getId();
			int nums=list.get(0).getLamount();
			int stock=list.get(0).getLversion().getVstock();
			if((num+nums)<=stock){
				mycart.setId(mcid);
				mycart.setLamount(num+nums);
				mycartDAO.merge(mycart);
				f=true;
			}else {
				f=false;
			}
		}else {
			mycart.setLamount(num);
			mycartDAO.merge(mycart);
			f=true;
		}
		
		return f;
		
	}
	
	/**
	 * 购买时从购物车获取购买的商品
	 */
	public Map getCart(int vid,int uid){
		String hql="from Mycart mc where mc.lversion.id=? and mc.users.id=?";
		List<Mycart> list=hqldao.findByHQL(hql, vid,uid);
		
		List addrlist=addressService.getAddress(uid);
		
		Map map=new HashMap();
		map.put("buylist", list);
		map.put("addrlist", addrlist);
		return map;
	}
	
	/**
	 * 提交订单
	 */
	
	public Map submitOrder(int uid,int aid,double tprice,String other,List<Mycart> pList){
		String hql="select max(onum) from Torder where onum like ?";
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString=sdf.format(date);
		String datesString2=sdf2.format(date);
		long lo=0;
		String onum=null;
		List list=hqldao.findByHQL(hql, "%"+dateString+"%");
		if (list.get(0)!=null&&list.size()>0) {
			String onumStr=list.get(0).toString();
			lo=Long.parseLong(onumStr.substring(onumStr.length()-5));
			lo++;
			onum="ZYH"+datesString2+String.valueOf(lo);
		}else {
			onum="ZYH"+datesString2+"10001";
		}
		Torder torder=new Torder();
		Users users=new Users();
		Addresses addresses=new Addresses();
		users.setId(uid);
		addresses.setId(aid);
		torder.setUsers(users);
		torder.setAddresses(addresses);
		torder.setTprice(tprice);
		torder.setOnum(onum);
		torder.setStatus(1);
		torder.setOther(other);
		torderDAO.save(torder);
		
		for (Mycart mycart : pList) {
			Orders orders=new Orders();
			orders.setTorder(torder);
			orders.setLversion(mycart.getLversion());
			orders.setPakages(mycart.getPakages());
			orders.setLamount(mycart.getLamount());
			ordersDAO.save(orders);
			mycartDAO.delete(mycart);
			hql="update Lversion set vstock=vstock-? where id=?";
			hqldao.bulkUpdate(hql, mycart.getLamount(),mycart.getLversion().getId());
		}
		
		Map map=new HashMap();
		map.put("onum", onum);
		map.put("tprice", tprice);
		map.put("ordername", "神州商城官网");
		
		return map;
	}
	
	/**
	 * 分页显示商品
	 */
	public Map showAllProduct(int page){
		String hql="select count(*) from Laptop";
		int total=Integer.parseInt(hqldao.findByHQL(hql).get(0).toString());
		
		int size=8;
		
		int pageSize=total%size==0?total/size:total/size+1;
		
		int prevPage=page-1<1?1:page-1;
		int nextPage=page+1>pageSize?pageSize:page+1;
		
		if (page<1) {
			page=1;
		}
		
		if (page>pageSize) {
			page=pageSize;
		}
		
		hql="from Lversion lv group by lv.laptop.id";
		List list=hqldao.pageQuery(hql, page, size);
		
		Map map=new HashMap();
		map.put("allpList", list);
		map.put("pageSize", pageSize);
		map.put("total", total);
		map.put("page", page);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		
		return map;
	}
	
	/**
	 * 搜索
	 */
	public Map getSearch(int page,String keyword){
		String hql="select count(*) from Laptop where lname like ?";
		int total=Integer.parseInt(hqldao.findByHQL(hql,"%"+keyword+"%").get(0).toString());
		
		int size=8;
		
		int pageSize=total%size==0?total/size:total/size+1;
		
		int prevPage=page-1<1?1:page-1;
		int nextPage=page+1>pageSize?pageSize:page+1;
		
		if (page<1) {
			page=1;
		}
		
		if (page>pageSize) {
			page=pageSize;
		}
		
		hql="from Lversion lv where lv.laptop.lname like ? group by lv.laptop.id";
		List list=hqldao.pageQuery(hql, page, size,"%"+keyword+"%");
		
		Map map=new HashMap();
		map.put("allpList", list);
		map.put("pageSize", pageSize);
		map.put("total", total);
		map.put("page", page);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		
		return map;
	}
	
	/**
	 * 取消订单时更改库存信息
	 */
	public void changeSales(int toid){
		Torder torder=torderDAO.findById(toid);
		Set<Orders> set=torder.getOrderses();
		String hql="update Lversion set vstock=vstock+? where id=?";
		for (Orders orders : set) {
			hqldao.bulkUpdate(hql, orders.getLamount(),orders.getLversion().getId());
		}
	}
	
	public Map getProductByType(int page,int type){
		String hql="select count(*) from Laptop lt where lt.series.laptoptype.id=?";
		int total=hqldao.unique(hql, type);
		
		int size=8;
		
		int pageSize=total%size==0?total/size:total/size+1;
		
		int prevPage=page-1<1?1:page-1;
		int nextPage=page+1>pageSize?pageSize:page+1;
		
		if (page<1) {
			page=1;
		}
		
		if (page>pageSize) {
			page=pageSize;
		}
		
		hql="from Lversion lv where lv.laptop.series.laptoptype.id=? group by lv.laptop.id";
		
		List list=hqldao.pageQuery(hql, page, size,type);
		
		Map map=new HashMap();
		
		map.put("allpList", list);
		map.put("pageSize", pageSize);
		map.put("total", total);
		map.put("page", page);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		
		return map;
		
	}
	
}
