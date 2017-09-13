package com.pojo;



/**
 * Mycollect entity. @author MyEclipse Persistence Tools
 */

public class Mycollect  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Users users;
     private Lversion lversion;


    // Constructors

    /** default constructor */
    public Mycollect() {
    }

    
    /** full constructor */
    public Mycollect(Users users, Lversion lversion) {
        this.users = users;
        this.lversion = lversion;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
   








}