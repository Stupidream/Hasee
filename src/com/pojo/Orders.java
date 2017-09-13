package com.pojo;



/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Orders  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Pakages pakages;
     private Torder torder;
     private Lversion lversion;
     private Integer lamount;


    // Constructors

    /** default constructor */
    public Orders() {
    }

    
    /** full constructor */
    public Orders( Pakages pakages, Torder torder, Lversion lversion, Integer lamount) {
        this.pakages = pakages;
        this.torder = torder;
        this.lversion = lversion;
        this.lamount = lamount;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }


    public Pakages getPakages() {
        return this.pakages;
    }
    
    public void setPakages(Pakages pakages) {
        this.pakages = pakages;
    }

    public Torder getTorder() {
        return this.torder;
    }
    
    public void setTorder(Torder torder) {
        this.torder = torder;
    }

    public Lversion getLversion() {
        return this.lversion;
    }
    
    public void setLversion(Lversion lversion) {
        this.lversion = lversion;
    }

    public Integer getLamount() {
        return this.lamount;
    }
    
    public void setLamount(Integer lamount) {
        this.lamount = lamount;
    }
   








}