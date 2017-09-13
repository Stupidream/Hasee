package com.action.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Torder;
import com.service.admin.AllOrderService;

@Controller
@RequestMapping("/admin/omanager.do")
public class AllOrderAction {
	@Autowired
	private AllOrderService allOrderService;
	
	/**
	 * 显示所有订单
	 */
	@RequestMapping(params="p=showAllOrder")
	public String showAllOrder(HttpServletRequest request){
		List list=allOrderService.showAllOrder();
		request.setAttribute("allorder", list);
		return "product_order.jsp";
	}
	
	@RequestMapping(params="p=showDetail")
	public String showDetail(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		Map map=allOrderService.showDetail(id);
		request.setAttribute("odetailMap", map);
		return "order_detail.jsp";
	}
	
	@RequestMapping(params="p=queryByDate")
	public String queryByDate(HttpServletRequest request){
		String minDate=request.getParameter("minDate");
		String maxDate=request.getParameter("maxDate");
		List list=allOrderService.queryByDate(minDate,maxDate);
		request.setAttribute("allorder", list);
		return "product_order.jsp";
	}
	
	/**
	 * 发货,添加快递单号
	 */
	@RequestMapping(params="p=sendOut")
	@ResponseBody
	public String addExpressNumber(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		String epxnum=request.getParameter("epxnum");
		allOrderService.addExpressNumber(id,epxnum);
		return "ok";
	}
	
}
