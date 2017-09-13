package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Mycart;
import com.service.CollectService;
import com.utils.UidUtil;

@Controller
@RequestMapping("collect.do")
public class CollectAction {
	@Autowired 
	private CollectService collectService;
	
	/**
	 * 显示收藏夹
	 */
	@RequestMapping(params="p=showcollect")
	public String showCollect(HttpServletRequest request){
		int uid=UidUtil.getUid(request);
		List collectList=collectService.showCollect(uid);
		request.setAttribute("collectList", collectList);
		return "collect.jsp";
	}

	/**
	 * 商品详情页面添加收藏
	 */
	@RequestMapping(params="p=addcollect")
	@ResponseBody
	public String addCollect(HttpServletRequest request){
		int vid=Integer.parseInt(request.getParameter("vid"));
		int uid=UidUtil.getUid(request);
		boolean f=collectService.addCollect(uid, vid);
		if (f) {
			return "ok";
		}else {
			return "no";
		}
	}
	
	/**
	 * 购物车页面添加收藏
	 */
	@RequestMapping(params="p=addCollectOnCart")
	@ResponseBody
	public String addCollectOnCart(HttpServletRequest request){
		int vid=Integer.parseInt(request.getParameter("vid"));
		int uid=UidUtil.getUid(request);
		boolean f=collectService.addCollect(uid, vid);
		if (f) {
			return "ok";
		}else {
			return "no";
		}
	}
	
	/**
	 * 批量添加收藏
	 */
	@RequestMapping(params="p=addSelcollect")
	@ResponseBody
	public String addSelcollect(HttpServletRequest request){
		String idString=request.getParameter("idString");
		int uid=UidUtil.getUid(request);
		List<Mycart> list=(List<Mycart>) request.getSession().getAttribute("cartlist");
		
		String[] id=idString.split(",");
		
		for (int i = 0; i < id.length; i++) {
			for (Mycart mycart : list) {
				if (mycart.getId()==Integer.parseInt(id[i])) {
					collectService.addSelcollect(uid, mycart.getLversion().getId());
				}
			}
		}
		return "ok";
	}
	
	/**
	 * 移出收藏夹
	 */
	@RequestMapping(params="p=delcollect")
	@ResponseBody
	public String delCollect(HttpServletRequest request){
		String idString=request.getParameter("idString");
		String[] id=idString.split(",");
		for (int i = 0; i < id.length; i++) {
			collectService.delCollect(Integer.parseInt(id[i]));
		}
		return "ok";
	}
}
