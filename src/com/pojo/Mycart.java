package com.pojo;



/**
 * Mycart entity. @author MyEclipse Persistence Tools
 */

public class Mycart  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Pakages pakages;
     private Users users;
     private Lversion lversion;
     private Integer lamount;
     private int mark;
     
     


    // Constructors

    public int getMark() {
		return mark;
	}


	public void setMark(int mark) {
		this.mark = mark;
	}


	/** default constructor */
    public Mycart() {
    }

    
    /** full constructor */
    public Mycart(Pakages pakages, Users users, Lversion lversion, Integer lamount) {
        this.pakages = pakages;
        this.users = users;
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

    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
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