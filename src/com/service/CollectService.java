package com.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.MycollectDAO;
import com.pojo.Lversion;
import com.pojo.Mycollect;
import com.pojo.Users;

@Service
public class CollectService {
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private MycollectDAO mycollectDAO;
	
	/**
	 * 显示收藏夹
	 */
	public List showCollect(int uid){
		String hql="from Mycollect mc where mc.users.id=?";
		List list=hqldao.findByHQL(hql, uid);
		return list;
	}
	
	/**
	 * 商品详情页面添加收藏
	 */
	public boolean addCollect(int uid,int vid){
		
		String hql="from Mycollect mc where mc.users.id=? and mc.lversion.id=?";
		List list=hqldao.findByHQL(hql, uid,vid);
		
		Mycollect mycollect=new Mycollect();
		
		Users users=new Users();
		users.setId(uid);
		
		Lversion lversion=new Lversion();
		lversion.setId(vid);
		
		mycollect.setUsers(users);
		mycollect.setLversion(lversion);
		
		if (list.size()>0) {
			hql="delete Mycollect mc where mc.users.id=? and mc.lversion.id=?";
			hqldao.bulkUpdate(hql, uid,vid);
			return false;
		}else {
			mycollectDAO.save(mycollect);
			return true;
		}
	}
	
	/**
	 * 购物车页面添加收藏
	 */
	public boolean addCollectOnCart(int uid,int vid){
		String hql="from Mycollect mc where mc.users.id=? and mc.lversion.id=?";
		List list=hqldao.findByHQL(hql, uid,vid);
		
		Mycollect mycollect=new Mycollect();
		
		Users users=new Users();
		users.setId(uid);
		
		Lversion lversion=new Lversion();
		lversion.setId(vid);
		
		mycollect.setUsers(users);
		mycollect.setLversion(lversion);
		
		if (list.size()>0) {
			return false;
		}else {
			mycollectDAO.save(mycollect);
			return true;
		}
	}
	
	/**
	 * 批量添加收藏
	 */
	public void addSelcollect(int uid,int vid){
		String hql="from Mycollect mc where mc.users.id=? and mc.lversion.id=?";
		List list=hqldao.findByHQL(hql, uid,vid);
		
		Mycollect mycollect=new Mycollect();
		
		Users users=new Users();
		users.setId(uid);
		
		Lversion lversion=new Lversion();
		lversion.setId(vid);
		
		mycollect.setUsers(users);
		mycollect.setLversion(lversion);
		
		if (list.size()==0) {
			mycollectDAO.save(mycollect);
		}
	}
	
	/**
	 * 移出收藏夹
	 */
	public void delCollect(int id){
		Mycollect mycollect=new Mycollect();
		mycollect.setId(id);
		mycollectDAO.delete(mycollect);
	}
}
