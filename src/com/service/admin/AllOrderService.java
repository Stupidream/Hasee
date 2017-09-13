package com.service.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.TorderDAO;
import com.pojo.Express;
import com.pojo.Torder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Service
public class AllOrderService {
	
	@Autowired
	private TorderDAO torderDAO;
	@Autowired
	private HQLDAO hqldao;
	
	public List showAllOrder(){
		
		List list=torderDAO.findAll();
		
		return list;
		
	}
	
	public Map showDetail(int id){
		Torder torder=torderDAO.findById(id);
		String epxnum=torder.getEpxnum();
		
		Map map =new HashMap();
		
		map.put("odetail", torder);
		
		if (epxnum!=null) {
			try {
				List<Express> list=new ArrayList<Express>();
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
				
				Map<String, String> cmap=new HashMap<String, String>();
				cmap.put("BAIDUID", "FA5DE4CDEE10EF22EF1E464319CF2FE0:FG=1");
				cmap.put("PSTM", "1503066461");
				cmap.put("BIDUPSID", "1B85AF39CE27FFF3FAD3CD4251EEAC79");
				cmap.put("BAIDULOC", "12584829.676368_3246401.5141626_114092_158_1503124092206");
				cmap.put("FP_UID", "5f74ff6dd8450a91b4f42be459733f6d");
				cmap.put("PSINO", "7");
				cmap.put("H_PS_PSSID", "24238_1420_21088_22159");
				cmap.put("BDORZ", "B490B5EBF6F3CD402E515D22BCDA1598");
				
				Document doc = Jsoup.connect("https://sp0.baidu.com/9_Q4sjW91Qh3otqbppnN2DJv/pae/channel/data/asyncqury?appid=4001&nu="+epxnum)
				  .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36")
				  .timeout(1000)
				  .cookies(cmap)
				  .ignoreContentType(true)
				  .get();
				
				String PDinfo=doc.body().text().toString();
				
				JSONObject jsonObject=JSONObject.fromObject(PDinfo);
				
				if ("".equals(jsonObject.get("msg").toString())) {
					map.put("msg", 1);
					map.put("company", jsonObject.getJSONObject("data").getJSONObject("company").get("fullname"));
					map.put("companyLogo", jsonObject.getJSONObject("data").getJSONObject("company").getJSONObject("icon").get("normal"));
					map.put("status", jsonObject.getJSONObject("data").getJSONObject("info").get("status"));
					map.put("state", jsonObject.getJSONObject("data").getJSONObject("info").get("state"));
					JSONArray jsonArray=jsonObject.getJSONObject("data").getJSONObject("info").getJSONArray("context");
					for (int i = 0; i < jsonArray.size(); i++) {
						Express express=new Express();
						Long ld=new Long(jsonArray.getJSONObject(i).get("time").toString());
						express.setTime(sdf.format(ld*1000));
						express.setDesc(jsonArray.getJSONObject(i).get("desc").toString());
						list.add(express);
					}
					map.put("PDinfo", list);
					map.put("PDinfoSize", list.size());
				}else {
					map.put("msg", 0);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return map;
		
	}
	
	public List queryByDate(String minDate,String maxDate){
		String hql="from Torder where otime between ? and ?";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List list=null;
		try {
			list = hqldao.findByHQL(hql, sdf.parse(minDate) ,sdf.parse(maxDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void addExpressNumber(int id,String epxnum){
		String hql="update Torder set status=3,epxnum=? where id=?";
		hqldao.bulkUpdate(hql, epxnum,id);
	}
}
