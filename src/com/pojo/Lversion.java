package com.pojo;

import java.util.HashSet;
import java.util.Set;


/**
 * Lversion entity. @author MyEclipse Persistence Tools
 */

public class Lversion  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Laptop laptop;
     private Colors colors;
     private String vname;
     private Double vprice;
     private Double mprice;
     private Integer vsales;
     private Integer vstock;
     private Integer state;
     private Set indexses = new HashSet(0);
     private Set orderses = new HashSet(0);
     private Set mycarts = new HashSet(0);
     private Set saleses = new HashSet(0);
     private Set mycollects = new HashSet(0);


    // Constructors

    /** default constructor */
    public Lversion() {
    }

    
    /** full constructor */
    public Lversion(Laptop laptop, Colors colors, String vname, Double vprice, Double mprice, Integer vsales, Integer vstock, Integer state, Set indexses, Set orderses, Set mycarts, Set saleses, Set mycollects) {
        this.laptop = laptop;
        this.colors = colors;
        this.vname = vname;
        this.vprice = vprice;
        this.mprice = mprice;
        this.vsales = vsales;
        this.vstock = vstock;
        this.state = state;
        this.indexses = indexses;
        this.orderses = orderses;
        this.mycarts = mycarts;
        this.saleses = saleses;
        this.mycollects = mycollects;
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

    public Colors getColors() {
        return this.colors;
    }
    
    public void setColors(Colors colors) {
        this.colors = colors;
    }

    public String getVname() {
        return this.vname;
    }
    
    public void setVname(String vname) {
        this.vname = vname;
    }

    public Double getVprice() {
        return this.vprice;
    }
    
    public void setVprice(Double vprice) {
        this.vprice = vprice;
    }

    public Double getMprice() {
        return this.mprice;
    }
    
    public void setMprice(Double mprice) {
        this.mprice = mprice;
    }

    public Integer getVsales() {
        return this.vsales;
    }
    
    public void setVsales(Integer vsales) {
        this.vsales = vsales;
    }

    public Integer getVstock() {
        return this.vstock;
    }
    
    public void setVstock(Integer vstock) {
        this.vstock = vstock;
    }

    public Integer getState() {
        return this.state;
    }
    
    public void setState(Integer state) {
        this.state = state;
    }

    public Set getIndexses() {
        return this.indexses;
    }
    
    public void setIndexses(Set indexses) {
        this.indexses = indexses;
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

    public Set getSaleses() {
        return this.saleses;
    }
    
    public void setSaleses(Set saleses) {
        this.saleses = saleses;
    }

    public Set getMycollects() {
        return this.mycollects;
    }
    
    public void setMycollects(Set mycollects) {
        this.mycollects = mycollects;
    }
   








}