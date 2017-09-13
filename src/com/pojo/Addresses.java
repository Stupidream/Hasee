package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Addresses entity. @author MyEclipse Persistence Tools
 */

public class Addresses  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Users users;
     private String dlprovince;
     private String dlcity;
     private String dlcounty;
     private String dtaddress;
     private Integer zipcode;
     private String realname;
     private String phone;
     private Integer defalut;
     private Set torders = new HashSet(0);


    // Constructors

    /** default constructor */
    public Addresses() {
    }

    
    /** full constructor */
    public Addresses(Users users, String dlprovince, String dlcity, String dlcounty, String dtaddress, Integer zipcode, String realname, String phone, Integer defalut, Set torders) {
        this.users = users;
        this.dlprovince = dlprovince;
        this.dlcity = dlcity;
        this.dlcounty = dlcounty;
        this.dtaddress = dtaddress;
        this.zipcode = zipcode;
        this.realname = realname;
        this.phone = phone;
        this.defalut = defalut;
        this.torders = torders;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    public String getDlprovince() {
        return this.dlprovince;
    }
    
    public void setDlprovince(String dlprovince) {
        this.dlprovince = dlprovince;
    }

    public String getDlcity() {
        return this.dlcity;
    }
    
    public void setDlcity(String dlcity) {
        this.dlcity = dlcity;
    }

    public String getDlcounty() {
        return this.dlcounty;
    }
    
    public void setDlcounty(String dlcounty) {
        this.dlcounty = dlcounty;
    }

    public String getDtaddress() {
        return this.dtaddress;
    }
    
    public void setDtaddress(String dtaddress) {
        this.dtaddress = dtaddress;
    }

    public Integer getZipcode() {
        return this.zipcode;
    }
    
    public void setZipcode(Integer zipcode) {
        this.zipcode = zipcode;
    }

    public String getRealname() {
        return this.realname;
    }
    
    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getDefalut() {
        return this.defalut;
    }
    
    public void setDefalut(Integer defalut) {
        this.defalut = defalut;
    }

    public Set getTorders() {
        return this.torders;
    }
    
    public void setTorders(Set torders) {
        this.torders = torders;
    }
   








}