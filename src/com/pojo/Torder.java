package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


/**
 * Torder entity. @author MyEclipse Persistence Tools
 */

public class Torder  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Addresses addresses;
     private Users users;
     private String onum;
     private Double tprice;
     private Timestamp otime;
     private Integer status;
     private String other;
     private String epxnum;
     private String tradeNo;
     private Set orderses = new HashSet(0);


    // Constructors

    /** default constructor */
    public Torder() {
    }

    
    /** full constructor */
    public Torder(Addresses addresses, Users users, String onum, Double tprice, Timestamp otime, Integer status, String other, String epxnum, String tradeNo, Set orderses) {
        this.addresses = addresses;
        this.users = users;
        this.onum = onum;
        this.tprice = tprice;
        this.otime = otime;
        this.status = status;
        this.other = other;
        this.epxnum = epxnum;
        this.tradeNo = tradeNo;
        this.orderses = orderses;
    }

   
    // Property accessors
    
    

    public Integer getId() {
        return this.id;
    }
    
    public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public void setId(Integer id) {
        this.id = id;
    }

    public Addresses getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Addresses addresses) {
        this.addresses = addresses;
    }

    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    public String getOnum() {
        return this.onum;
    }
    
    public void setOnum(String onum) {
        this.onum = onum;
    }

    public Double getTprice() {
        return this.tprice;
    }
    
    public void setTprice(Double tprice) {
        this.tprice = tprice;
    }

    public Timestamp getOtime() {
        return this.otime;
    }
    
    public void setOtime(Timestamp otime) {
        this.otime = otime;
    }

    public String getOther() {
        return this.other;
    }
    
    public void setOther(String other) {
        this.other = other;
    }

    public String getEpxnum() {
        return this.epxnum;
    }
    
    public void setEpxnum(String epxnum) {
        this.epxnum = epxnum;
    }

    public String getTradeNo() {
        return this.tradeNo;
    }
    
    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public Set getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set orderses) {
        this.orderses = orderses;
    }
   








}