package com.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.HQLDAO;
import com.dao.MycartDAO;
import com.pojo.Mycart;

@Service
public class CartService {
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private MycartDAO mycartDAO;
	
	/**
	 * 获取购物车总数
	 * @param uid
	 * @return
	 */
	public String getcartAmount(int uid){
		String hql="select count(*) from Mycart mc where mc.users.id=?";
		String cartamount=hqldao.findByHQL(hql, uid).get(0).toString();
		return cartamount;
	}
	
	/**
	 * 显示购物车
	 */
	
	public List showCart(int uid){
		String hql="from Mycart mc where mc.users.id=?";
		List list=hqldao.findByHQL(hql, uid);
		
		return list;
	}
	
	/**
	 * 从购物车删除商品
	 */
	public void deleteCart(int id){
		Mycart mycart=new Mycart();
		mycart.setId(id);
		mycartDAO.delete(mycart);
	}
	
	/**
	 * 修改购物车数量
	 */
	public void changeNum(int num,int id){
		String hql="update Mycart set lamount=? where id=?";
		hqldao.bulkUpdate(hql, num,id);
	}
	
	/**
	 * 结算
	 */
	public void toPay(){
		
	}
}
