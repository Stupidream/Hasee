package com.pojo;



/**
 * Indexs entity. @author MyEclipse Persistence Tools
 */

public class Indexs  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Laptop laptop;
     private Lversion lversion;
     private Integer isid;


    // Constructors

    /** default constructor */
    public Indexs() {
    }

    
    /** full constructor */
    public Indexs(Laptop laptop, Lversion lversion, Integer isid) {
        this.laptop = laptop;
        this.lversion = lversion;
        this.isid = isid;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Laptop getLaptop() {
        return this.laptop;
    }
    
    public void setLaptop(Laptop laptop) {
        this.laptop = laptop;
    }

    public Lversion getLversion() {
        return this.lversion;
    }
    
    public void setLversion(Lversion lversion) {
        this.lversion = lversion;
    }

    public Integer getIsid() {
        return this.isid;
    }
    
    public void setIsid(Integer isid) {
        this.isid = isid;
    }
   








}