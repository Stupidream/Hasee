package com.action.admin;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.admin.AdminService;

@Controller
@RequestMapping("admin/admin.do")
public class AdminAction {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(params="p=CheckPassword")
	@ResponseBody
	public String CheckPassword(HttpServletRequest request){
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		boolean f=adminService.checkPassword(username, password);
		if (f) {
			request.getSession().setAttribute("adminName", username);
			return "ok";
		}else {
			return "no";
		}
	}
	
}
