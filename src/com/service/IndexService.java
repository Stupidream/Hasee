package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.IndexsDAO;
import com.pojo.Indexs;
import com.pojo.Laptop;

@Service
public class IndexService {
	
	@Autowired
	private HQLDAO hqldao;
	
	
	public Map showIndex(){
		String hql="from Indexs where isid=1 order by id desc";
		List list1=hqldao.findByHQL(hql);
		hql="from Indexs where isid=2 order by id desc";
		List list2=hqldao.findByHQL(hql);
		hql="from Indexs where isid=3 order by id desc";
		List list3=hqldao.findByHQL(hql);
		hql="from Lversion order by vsales desc";
		List toplist=hqldao.pageQuery(hql, 1, 5);
		Map map=new HashMap();
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("toplist", toplist);
		
		return map;
	}
}
