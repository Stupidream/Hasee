package com.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressesDAO;
import com.dao.HQLDAO;
import com.pojo.Addresses;
import com.pojo.Users;

@Service
public class AddressService {

	@Autowired
	private AddressesDAO addressesDAO;
	@Autowired
	private HQLDAO hqldao;
	
	public String getAddressByid(int id){
		Addresses addresses=addressesDAO.findById(id);
		StringBuffer sb=new StringBuffer();
		sb.append("{'id':").append(addresses.getId()).append(",");
		sb.append("'dlprovince':'").append(addresses.getDlprovince()).append("',");
		sb.append("'dlcity':'").append(addresses.getDlcity()).append("',");
		sb.append("'dlcounty':'").append(addresses.getDlcounty()).append("',");
		sb.append("'dtaddress':'").append(addresses.getDtaddress()).append("',");
		sb.append("'zipcode':'").append(addresses.getZipcode()).append("',");
		sb.append("'realname':'").append(addresses.getRealname()).append("',");
		sb.append("'phone':'").append(addresses.getPhone()).append("'}");
		return sb.toString();
	}
	
	/**
	 * 添加或者更新地址
	 * @param id
	 * @param uid
	 * @param dlprovince
	 * @param dlcity
	 * @param dlcounty
	 * @param dtaddress
	 * @param zipcode
	 * @param realname
	 * @param phone
	 */
	public void addOrUpdateAddress(int id,int uid,String dlprovince,String dlcity,String dlcounty,String dtaddress,int zipcode,String realname,String phone){
		Addresses addresses=new Addresses();
		Users users=new Users();
		users.setId(uid);
		addresses.setUsers(users);
		addresses.setDlprovince(dlprovince);
		addresses.setDlcity(dlcity);
		addresses.setDlcounty(dlcounty);
		addresses.setDtaddress(dtaddress);
		addresses.setZipcode(zipcode);
		addresses.setRealname(realname);
		addresses.setPhone(phone);
		if (id==0){
			addressesDAO.merge(addresses);
		}else {
			addresses.setId(id);
			addressesDAO.merge(addresses);
		}
	}
	
	/**
	 * 获取地址
	 * @param uid
	 */
	public List getAddress(int uid){
		String hql="from Addresses ars where ars.users.id=?";
		List list=hqldao.findByHQL(hql, uid);
		return list;
	}
	
	/**
	 * 删除收货地址
	 * @param request
	 * @return
	 */
	public void deleteAddress(int id){
		Addresses addresses=new Addresses();
		addresses.setId(id);
		addressesDAO.delete(addresses);
	}
}
