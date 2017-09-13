package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.ProductService;
import com.utils.UidUtil;

@Controller
@RequestMapping("product.do")
public class ProductAction {
	@Autowired
	private ProductService pService;
	
	/**
	 * 显示产品详情
	 * @param request
	 * @return
	 */
	@RequestMapping(params="p=showdetail")
	public String showDetail(HttpServletRequest request){
		int vid=Integer.parseInt(request.getParameter("vid"));
		int uid=UidUtil.getUid(request);
		
		String token=String.valueOf(System.currentTimeMillis());
		
		Map pmap=pService.showDetail(vid,uid);
		
		request.setAttribute("pmap", pmap);
		request.getSession().setAttribute("form_token",token);
		return "detail.jsp";
	}
	
	/**
	 * 添加购物车
	 */
	@RequestMapping(params="p=addcart")
	@ResponseBody
	public String addCart(HttpServletRequest request){
		int vid=Integer.parseInt(request.getParameter("vid"));
		int uid=UidUtil.getUid(request);
		int pid=Integer.parseInt(request.getParameter("pid"));
		int num=Integer.parseInt(request.getParameter("num"));
		boolean f=pService.addCart(uid, vid, pid, num);
		if (f) {
			return "ok";
		}else {
			return "no";
		}
	}
	
	/**
	 * 立即购买
	 */
	@RequestMapping(params="p=buy")
	public String buy(HttpServletRequest request){
		int vid=Integer.parseInt(request.getParameter("vid"));
		int uid=UidUtil.getUid(request);
		int pid=Integer.parseInt(request.getParameter("pid"));
		int num=Integer.parseInt(request.getParameter("num"));
		
		String token=(String) request.getSession().getAttribute("form_token");
		Map buymap=null;
		
		if (token!=null) {
			pService.addCart(uid, vid, pid, num);
			buymap=pService.getCart(vid, uid);
			request.getSession().setAttribute("form_token", null);
		}else {
			buymap=pService.getCart(vid, uid);
		}
		
		request.getSession().setAttribute("buymap", buymap);
		return "odercheckout.jsp";
	}
	
	/**
	 * 提交订单
	 */
	@RequestMapping(params="p=submitorder")
	public String submitOrder(HttpServletRequest request){
		double tprice=Double.parseDouble(request.getParameter("tprice"));
		int uid=UidUtil.getUid(request);
		int aid=Integer.parseInt(request.getParameter("radio"));
		String other=request.getParameter("other");
		Map map=(Map) request.getSession().getAttribute("buymap");
		List pList=(List) map.get("buylist");
		Map pmmap=pService.submitOrder(uid, aid, tprice, other,pList);
		request.setAttribute("pmmap", pmmap);
		
		return "payment.jsp";
	}
	
	/**
	 * 显示所有产品
	 */
	@RequestMapping(params="p=showAll")
	public String showAllProduct(HttpServletRequest request){
		String pageString=request.getParameter("page");
		int page=1;
		if (pageString!=null) {
			page=Integer.parseInt(pageString);
		}
		Map map=pService.showAllProduct(page);
		request.setAttribute("allpMap", map);
		request.setAttribute("method", "showAll");
		return "all.jsp";
	}
	
	/**
	 * 搜索
	 * @param request
	 * @return
	 */
	@RequestMapping(params="p=search")
	public String doSearch(HttpServletRequest request){
		String pageString=request.getParameter("page");
		String keyword=request.getParameter("keyword");
		int page=1;
		if (pageString!=null) {
			page=Integer.parseInt(pageString);
		}
		Map map=pService.getSearch(page,keyword);
		request.setAttribute("allpMap", map);
		request.setAttribute("method", "search&keyword="+keyword);
		return "all.jsp";
	}
	
	@RequestMapping(params="p=showProductByType")
	public String showProductByType(HttpServletRequest request){
		int ltid=Integer.parseInt(request.getParameter("ltid"));
		String pageString=request.getParameter("page");
		int page=1;
		if (pageString!=null) {
			page=Integer.parseInt(pageString);
		}
		
		Map map=pService.getProductByType(page, ltid);
		request.setAttribute("method", "showProductByType&ltid="+ltid);
		request.setAttribute("allpMap", map);
		return "all.jsp";
	}
	
}
