package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Mycart;
import com.service.AddressService;
import com.service.CartService;
import com.utils.UidUtil;

@Controller
@RequestMapping("cart.do")
public class CartAction {
	@Autowired
	private CartService cartService;
	@Autowired
	private AddressService addressService;
	
	/**
	 * 获取购物车总数
	 * @param request
	 * @return
	 */
	
	@RequestMapping(params="p=getcartAmount")
	@ResponseBody
	public String getcartAmount(HttpServletRequest request){
		int uid=UidUtil.getUid(request);
		String cartamount=cartService.getcartAmount(uid);
		return cartamount;
	}
	
	/**
	 * 显示购物车
	 */
	@RequestMapping(params="p=showmycart")
	public String showCart(HttpServletRequest request){
		int uid=UidUtil.getUid(request);
		List list=cartService.showCart(uid);
		request.getSession().setAttribute("cartlist", list);
		return "mycart.jsp";
	}
	
	/**
	 * 从购物车删除商品
	 */
	@RequestMapping(params="p=delcart")
	@ResponseBody
	public String deleteCart(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		cartService.deleteCart(id);
		return "ok";
	}
	
	/**
	 * 修改购物车数量
	 */
	@RequestMapping(params="p=changeNum")
	@ResponseBody
	public void changeNum(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int num=Integer.parseInt(request.getParameter("num"));
		cartService.changeNum(num, id);
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(params="p=delSelcart")
	@ResponseBody
	public String delSelcart(HttpServletRequest request){
		String idString=request.getParameter("idString");
		String[] id=idString.split(",");
		for (int i = 0; i < id.length; i++) {
			cartService.deleteCart(Integer.parseInt(id[i]));
		}
		return "ok";
	}
	
	/**
	 * 结算
	 */
	@RequestMapping(params="p=toPay")
	@ResponseBody
	public String toPay(HttpServletRequest request){
		String idString=request.getParameter("idString");
		
		List<Mycart> list=(List<Mycart>) request.getSession().getAttribute("cartlist");
		int uid=UidUtil.getUid(request);
		
		List addrlist=addressService.getAddress(uid);
		List buylist=new ArrayList();
		
		String[] id=idString.split(",");
		
		for (int i = 0; i < id.length; i++) {
			for (Mycart mycart : list) {
				if (mycart.getId()==Integer.parseInt(id[i])) {
					buylist.add(mycart);
				}
			}
		}
		
		Map buymap=new HashMap();
		buymap.put("buylist", buylist);
		buymap.put("addrlist", addrlist);
		
		request.getSession().setAttribute("buymap", buymap);
		
		return "ok";
	}
	
}
