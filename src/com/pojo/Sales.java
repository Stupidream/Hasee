package com.pojo;

import java.sql.Timestamp;


/**
 * Sales entity. @author MyEclipse Persistence Tools
 */

public class Sales  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Laptop laptop;
     private Lversion lversion;
     private Integer amount;
     private Long total;
     private Timestamp sdate;


    // Constructors

    /** default constructor */
    public Sales() {
    }

    
    /** full constructor */
    public Sales(Laptop laptop, Lversion lversion, Integer amount, Long total, Timestamp sdate) {
        this.laptop = laptop;
        this.lversion = lversion;
        this.amount = amount;
        this.total = total;
        this.sdate = sdate;
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

    public Integer getAmount() {
        return this.amount;
    }
    
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Long getTotal() {
        return this.total;
    }
    
    public void setTotal(Long total) {
        this.total = total;
    }

    public Timestamp getSdate() {
        return this.sdate;
    }
    
    public void setSdate(Timestamp sdate) {
        this.sdate = sdate;
    }
   








}