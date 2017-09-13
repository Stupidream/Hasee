package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String username;
     private String password;
     private String realname;
     private String nickname;
     private String rdprovince;
     private String rdcity;
     private String rdcounty;
     private String qqID;
     private Set torders = new HashSet(0);
     private Set addresseses = new HashSet(0);
     private Set mycarts = new HashSet(0);
     private Set mycollects = new HashSet(0);


    // Constructors

    /** default constructor */
    public Users() {
    }

    
    /** full constructor */
    public Users(String username, String password, String realname, String nickname, String rdprovince, String rdcity, String rdcounty,String qqID, Set torders, Set addresseses, Set mycarts, Set mycollects) {
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.nickname = nickname;
        this.rdprovince = rdprovince;
        this.rdcity = rdcity;
        this.rdcounty = rdcounty;
        this.qqID=qqID;
        this.torders = torders;
        this.addresseses = addresseses;
        this.mycarts = mycarts;
        this.mycollects = mycollects;
    }

   
    // Property accessors

    
    
    public Integer getId() {
        return this.id;
    }
    
    public String getQqID() {
		return qqID;
	}


	public void setQqID(String qqID) {
		this.qqID = qqID;
	}


	public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealname() {
        return this.realname;
    }
    
    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getNickname() {
        return this.nickname;
    }
    
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRdprovince() {
        return this.rdprovince;
    }
    
    public void setRdprovince(String rdprovince) {
        this.rdprovince = rdprovince;
    }

    public String getRdcity() {
        return this.rdcity;
    }
    
    public void setRdcity(String rdcity) {
        this.rdcity = rdcity;
    }

    public String getRdcounty() {
        return this.rdcounty;
    }
    
    public void setRdcounty(String rdcounty) {
        this.rdcounty = rdcounty;
    }

    public Set getTorders() {
        return this.torders;
    }
    
    public void setTorders(Set torders) {
        this.torders = torders;
    }

    public Set getAddresseses() {
        return this.addresseses;
    }
    
    public void setAddresseses(Set addresseses) {
        this.addresseses = addresseses;
    }

    public Set getMycarts() {
        return this.mycarts;
    }
    
    public void setMycarts(Set mycarts) {
        this.mycarts = mycarts;
    }

    public Set getMycollects() {
        return this.mycollects;
    }
    
    public void setMycollects(Set mycollects) {
        this.mycollects = mycollects;
    }
   








}