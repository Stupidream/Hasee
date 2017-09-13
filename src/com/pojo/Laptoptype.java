package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Laptoptype entity. @author MyEclipse Persistence Tools
 */

public class Laptoptype  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String tname;
     private Set serieses = new HashSet(0);


    // Constructors

    /** default constructor */
    public Laptoptype() {
    }

    
    /** full constructor */
    public Laptoptype(String tname, Set serieses) {
        this.tname = tname;
        this.serieses = serieses;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getTname() {
        return this.tname;
    }
    
    public void setTname(String tname) {
        this.tname = tname;
    }

    public Set getSerieses() {
        return this.serieses;
    }
    
    public void setSerieses(Set serieses) {
        this.serieses = serieses;
    }
   








}