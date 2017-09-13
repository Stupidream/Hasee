package com.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.AddressService;
import com.utils.UidUtil;

@Controller
@RequestMapping("addr.do")
public class AddressAction {

	@Autowired
	private AddressService addrService;
	
	/**
	 * 显示收货地址
	 */
	@RequestMapping(params="p=showaddress")
	public String showAddress(HttpServletRequest request){
		
		int uid=UidUtil.getUid(request);
		List addrlist=addrService.getAddress(uid);
		request.setAttribute("addrlist", addrlist);
		return "myaddress.jsp";
		
	}
	/**
	 * 编辑收货地址
	 */
	@RequestMapping(params="p=editaddr")
	@ResponseBody
	public String editAddress(HttpServletRequest request){
		int aid=Integer.parseInt(request.getParameter("id"));
		String addresses=addrService.getAddressByid(aid);
		return addresses;
	}
	
	/**
	 * 添加或者修改收货地址
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping(params="p=add_addr")
	@ResponseBody
	public String addOrUpdateAddress(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id=Integer.parseInt(request.getParameter("aid"));
		int uid=UidUtil.getUid(request);
		String dlprovince=request.getParameter("s_province");
		String dlcity=request.getParameter("s_city");
		String dlcounty=request.getParameter("s_county");
		String dtaddress=request.getParameter("detail_addr");
		int zipcode=Integer.parseInt(request.getParameter("citycode"));
		String realname=request.getParameter("addrname");
		String phone=request.getParameter("addrtel");
		addrService.addOrUpdateAddress(id, uid, dlprovince, dlcity, dlcounty, dtaddress, zipcode, realname, phone);
		return "ok";
	}
	
	/**
	 * 删除地址
	 */
	@RequestMapping(params="p=dele_addr")
	@ResponseBody
	public String deleteAddress(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		addrService.deleteAddress(id);
		return "ok";
	}
}
