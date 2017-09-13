package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Series entity. @author MyEclipse Persistence Tools
 */

public class Series  implements java.io.Serializable {


    // Fields    

     private Integer sid;
     private Laptoptype laptoptype;
     private String sname;
     private Set laptops = new HashSet(0);


    // Constructors

    /** default constructor */
    public Series() {
    }

    
    /** full constructor */
    public Series(Laptoptype laptoptype, String sname, Set laptops) {
        this.laptoptype = laptoptype;
        this.sname = sname;
        this.laptops = laptops;
    }

   
    // Property accessors

    public Integer getSid() {
        return this.sid;
    }
    
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Laptoptype getLaptoptype() {
        return this.laptoptype;
    }
    
    public void setLaptoptype(Laptoptype laptoptype) {
        this.laptoptype = laptoptype;
    }

    public String getSname() {
        return this.sname;
    }
    
    public void setSname(String sname) {
        this.sname = sname;
    }

    public Set getLaptops() {
        return this.laptops;
    }
    
    public void setLaptops(Set laptops) {
        this.laptops = laptops;
    }
   








}