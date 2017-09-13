package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Pakages entity. @author MyEclipse Persistence Tools
 */

public class Pakages  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String pname;
     private Set orderses = new HashSet(0);
     private Set mycarts = new HashSet(0);


    // Constructors

    /** default constructor */
    public Pakages() {
    }

    
    /** full constructor */
    public Pakages(String pname, Set orderses, Set mycarts) {
        this.pname = pname;
        this.orderses = orderses;
        this.mycarts = mycarts;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getPname() {
        return this.pname;
    }
    
    public void setPname(String pname) {
        this.pname = pname;
    }

    public Set getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set orderses) {
        this.orderses = orderses;
    }

    public Set getMycarts() {
        return this.mycarts;
    }
    
    public void setMycarts(Set mycarts) {
        this.mycarts = mycarts;
    }
   








}