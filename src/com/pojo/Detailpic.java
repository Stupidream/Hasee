package com.pojo;



/**
 * Detailpic entity. @author MyEclipse Persistence Tools
 */

public class Detailpic  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Laptop laptop;
     private String picname;


    // Constructors

    /** default constructor */
    public Detailpic() {
    }

    
    /** full constructor */
    public Detailpic(Laptop laptop, String picname) {
        this.laptop = laptop;
        this.picname = picname;
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

    public String getPicname() {
        return this.picname;
    }
    
    public void setPicname(String picname) {
        this.picname = picname;
    }
   








}