package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Colors entity. @author MyEclipse Persistence Tools
 */

public class Colors  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String cname;
     private Set lversions = new HashSet(0);


    // Constructors

    /** default constructor */
    public Colors() {
    }

    
    /** full constructor */
    public Colors(String cname, Set lversions) {
        this.cname = cname;
        this.lversions = lversions;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getCname() {
        return this.cname;
    }
    
    public void setCname(String cname) {
        this.cname = cname;
    }

    public Set getLversions() {
        return this.lversions;
    }
    
    public void setLversions(Set lversions) {
        this.lversions = lversions;
    }
   








}