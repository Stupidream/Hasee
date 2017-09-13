package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.UsersDAO;
import com.pojo.Users;
import com.utils.MD5Util;

@Service
public class UsersService {
	
	@Autowired
	private HQLDAO hqldao;
	@Autowired 
	private UsersDAO usersDAO;
	
	public Users checkPassword(String username,String password){
		String hql="from Users where username=? and password=?";
		String pwd=MD5Util.getMD5(password);
		List<Users> list=hqldao.pageQuery2(hql, username,pwd);
		if (list!=null&&list.size()>0) {
			Users users=list.get(0);
			return users;
		}else {
			return null;
		}
	}
	
	public Users autoLogin(String username,String password){
		String hql="from Users where username=? and password=?";
		List<Users> list=hqldao.pageQuery2(hql, username,password);
		if (list!=null&&list.size()>0) {
			Users users=list.get(0);
			return users;
		}else {
			return null;
		}
	}
	
	public int getUid(String username) {
		List<Users> list=usersDAO.findByUsername(username);
		if (list.size()>0) {
			return list.get(0).getId();
		}else {
			return 0;
		}
	}
	
	public void doRegister(String username,String password){
		Users users=new Users();
		users.setUsername(username);
		users.setPassword(password);
		usersDAO.save(users);
	}
	
	public void changePassword(int id,String password){
		String hql="update Users set password=? where id=?";
		hqldao.bulkUpdate(hql, password,id);
	}
	
	public Users qqLogin(String qqID){
		List<Users> list=usersDAO.findByQQID(qqID);
		Users users;
		if (list!=null&&list.size()!=0) {
			users=list.get(0);
		}else {
			users=new Users();
			users.setQqID(qqID);
			usersDAO.save(users);
		}
		return users;
	}
}
