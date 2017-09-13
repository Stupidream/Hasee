package com.utils;

import javax.servlet.http.HttpServletRequest;

import com.pojo.Users;

public class UidUtil {
	
	public static int getUid(HttpServletRequest request){
		Users users=(Users) request.getSession().getAttribute("users");
		if (users!=null) {
			return users.getId();
		}else {
			return 0;
		}
	}
}
