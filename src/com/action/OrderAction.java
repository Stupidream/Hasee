package com.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Torder;
import com.service.OrderService;
import com.service.ProductService;
import com.utils.UidUtil;

@Controller
@RequestMapping("order.do")
public class OrderAction {
	@Autowired 
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	
	/**
	 * 显示订单
	 */
	@RequestMapping(params="p=showOrder")
	public String showOrder(HttpServletRequest request){
		int uid=UidUtil.getUid(request);
		String pString=request.getParameter("page");
		int page=1;
		
		if (pString!=null) {
			page=Integer.parseInt(pString);
		}
		Map map=orderService.getOrder(uid,page);
		request.setAttribute("omap", map);
		return "myorder.jsp";
	}
	
	/**
	 * 取消订单
	 */
	@RequestMapping(params="p=cancelorder")
	@ResponseBody
	public String cancelOrder(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		orderService.changeStatusByid(id, 5);
		productService.changeSales(id);
		return "ok";
	}
	
	/**
	 * 删除订单
	 */
	@RequestMapping(params="p=delorder")
	@ResponseBody
	public String delOrder(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		orderService.changeStatusByid(id, 0);
		return "ok";
	}
	
	/**
	 * 显示订单详情
	 */
	@RequestMapping(params="p=showdetail")
	public String showOrderDetail(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		Torder torder=orderService.showOrderDetail(id);
		request.setAttribute("orderdetail", torder);
		return "orderdetail.jsp";
	}
	
	/**
	 * 付款
	 */
	@RequestMapping(params="p=topay")
	public String toPay(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		Map map=orderService.toPay(id);
		request.setAttribute("pmmap", map);
		return "payment.jsp";
	}
	
	/**
	 * 确认收货
	 */
	@RequestMapping(params="p=receive")
	@ResponseBody
	public String Receive(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		orderService.changeStatusByid(id, 4);
		return "ok";
	}
	
	@RequestMapping(params="p=showExpressInfo")
	public String showExpressInfo(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		Map map=orderService.getExpressInfo(id);
		request.setAttribute("odetailMap", map);
		return "expressinfo.jsp";
	}
	
}
