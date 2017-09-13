package com.service.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.pojo.Users;
import com.utils.MD5Util;

@Service
public class AdminService {
	@Autowired
	private HQLDAO hqldao;
	
	public boolean checkPassword(String username,String password){
		String hql="from Admins where username=? and password=?";
		String pwd=MD5Util.getMD5(password);
		List<Users> list=hqldao.pageQuery2(hql, username,pwd);
		if (list!=null&&list.size()>0) {
			return true;
		}else {
			return false;
		}
	}
}
