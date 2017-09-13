package com.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Users;
import com.qq.connect.QQConnectException;
import com.qq.connect.oauth.Oauth;
import com.service.UsersService;
import com.utils.MD5Util;
import com.utils.UidUtil;

@Controller
@RequestMapping("users.do")
public class UsersAction {
	
	@Autowired
	private UsersService userService;
	
	@ResponseBody
	@RequestMapping(params="p=checkPassword")
	public String checkPassword(HttpServletRequest request){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Users users=userService.checkPassword(username, password);
		if (users!=null) {
			request.getSession().setAttribute("users", users);
			return "ok";
		}else {
			return "no";
		}
	}
	
	@RequestMapping(params="p=login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String autologin=request.getParameter("autologin");
		String referer=(String) request.getSession().getAttribute("referer");
		if ("on".equals(autologin)) {
			String username=request.getParameter("username");
			String id=String .valueOf(userService.getUid(username));
			String password=request.getParameter("password");
			String pwd=MD5Util.getMD5(password);
			Cookie user=new Cookie("user", username);
			Cookie psw=new Cookie("psw", pwd);
			user.setMaxAge(7 * 24 * 60 * 60);
			psw.setMaxAge(7 * 24 * 60 * 60);
			response.addCookie(user);
			response.addCookie(psw);
		}
		if (referer!=null) {
			response.sendRedirect(referer);
			request.getSession().removeAttribute("referer");
		}else {
			response.sendRedirect("index.jsp");
		}
	}
	
	@RequestMapping(params="p=dologin")
	public String doLogin(HttpServletRequest request){
		String referer=request.getHeader("Referer");
		request.getSession().setAttribute("referer", referer);
		return "login.jsp";
	}
	
	@RequestMapping(params="p=logout")
	public void doLogout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Cookie[] cookies=request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if ("psw".equals(cookies[i].getName())) {
				Cookie psw=new Cookie("psw", null);
				psw.setMaxAge(0);
				response.addCookie(psw);
			}
			if ("user".equals(cookies[i].getName())) {
				Cookie user=new Cookie("user", null);
				user.setMaxAge(0);
				response.addCookie(user);
			}
		}
		request.getSession().removeAttribute("users");
		response.sendRedirect("index.jsp");
	}
	
	@RequestMapping(params="p=checkUsername")
	@ResponseBody
	public String checkUsername(HttpServletRequest request){
		String username=request.getParameter("username");
		int uid=userService.getUid(username);
		if (uid>0) {
			return "no";
		}else {
			return "ok";
		}
	}
	
	/**
	 * 生成验证码
	 */
	@RequestMapping(params="p=getcode")
	@ResponseBody
	private void getCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Random ran=new Random();
		String s=getcode();
		
		request.getSession().setAttribute("yzm", s);
		
		response.setContentType("image/jpeg");
		
		//定义缓冲区大小
		BufferedImage bi=new BufferedImage(100,38,BufferedImage.TYPE_INT_RGB);
		
		//定义笔刷
		Graphics  graphics=bi.getGraphics();
		
		//笔刷颜色
		graphics.setColor(Color.white);
		graphics.fillRect(0, 0, 100, 38);
		
		//绘制矩形
		graphics.setColor(new Color(221,221,221));
		graphics.drawRect(1, 1, 100 - 2, 38 - 2);
		
		graphics.setColor(Color.blue);
		graphics.setFont(new Font("宋体",Font.BOLD,26));
		graphics.drawString(s.charAt(0)+"", 10, 18);
		
		graphics.setFont(new Font("宋体",Font.BOLD,22));
		graphics.drawString(s.charAt(1)+"", 30, 20);
		
		graphics.setFont(new Font("宋体",Font.BOLD,26));
		graphics.drawString(s.charAt(2)+"", 60, 28);
		
		graphics.setFont(new Font("宋体",Font.BOLD,22));
		graphics.drawString(s.charAt(3)+"", 83, 20);
		graphics.setColor(Color.DARK_GRAY);
		
		//绘制线条
		graphics.drawLine(ran.nextInt(100), ran.nextInt(38), ran.nextInt(100), ran.nextInt(38));
		graphics.drawLine(ran.nextInt(100), ran.nextInt(38), ran.nextInt(100), ran.nextInt(38));
		graphics.drawLine(ran.nextInt(100), ran.nextInt(38), ran.nextInt(100), ran.nextInt(38));
		graphics.drawLine(ran.nextInt(100), ran.nextInt(38), ran.nextInt(100), ran.nextInt(38));
		graphics.drawLine(ran.nextInt(100), ran.nextInt(38), ran.nextInt(100), ran.nextInt(38));
		ImageIO.write(bi, "jpeg", response.getOutputStream());
	}
	private String getcode() {
		String demo="123456789qwertyuiopasdfghjklzxcvbnm";
		StringBuffer sb=new StringBuffer();
		Random ran=new Random();
		for (int i = 0; i <4; i++) {
			
			int n=ran.nextInt(demo.length());
			char ch=demo.charAt(n);
			sb.append(ch);
		}
		return sb.toString();
	}
	
	@RequestMapping(params="p=checkcode")
	@ResponseBody
	public String checkCode(HttpServletRequest request){
		String code=request.getParameter("code");
		String yzm=(String) request.getSession().getAttribute("yzm");
		if (yzm.equals(code)) {
			return "ok";
		}else {
			return "no";
		}
	}
	
	@RequestMapping(params="p=register")
	public String doRegister(HttpServletRequest request){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		userService.doRegister(username, MD5Util.getMD5(password));
		String string=checkPassword(request);
		if ("ok".equals(string)) {
			return "index.jsp";
		}else {
			return "login.jsp";
		}
	}
	
	@RequestMapping(params="p=changePassword")
	public void changePassword(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int uid=UidUtil.getUid(request);
		String password=request.getParameter("password");
		userService.changePassword(uid, MD5Util.getMD5(password));
		doLogout(request, response);
	}
	
	@RequestMapping(params="p=qqlogin")
	public void qqLogin(HttpServletRequest request,HttpServletResponse response) throws IOException, QQConnectException{
		
		response.sendRedirect(new Oauth().getAuthorizeURL(request));
	}
	
}
