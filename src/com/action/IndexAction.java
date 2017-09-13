package com.action;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Users;
import com.service.IndexService;
import com.service.UsersService;

@Controller
@RequestMapping("index.do")
public class IndexAction {
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private IndexService indexService;
	
	/**
	 * 显示首页
	 * @param request
	 * @return
	 */
	@RequestMapping(params="p=showindex")
	public String getIndex(HttpServletRequest request){
		String user=null;
		String psw=null;
		
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			for(Cookie c:cookies){
				String key=c.getName();
				String value=c.getValue();
				if("user".equals(key)){
					user=value;
				}
				if("psw".equals(key)){
					psw=value;
				}
			}
		}
		if(user!=null&&psw!=null){
			Users users=usersService.autoLogin(user, psw);
			request.getSession().setAttribute("users", users);
		}
		Map map=indexService.showIndex();
		request.getSession().setAttribute("map", map);
		return "index.jsp";
	}
}
