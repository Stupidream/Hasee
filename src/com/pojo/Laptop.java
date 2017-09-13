package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


/**
 * Laptop entity. @author MyEclipse Persistence Tools
 */

public class Laptop  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Series series;
     private String lname;
     private Integer lsales;
     private Timestamp ltime;
     private Set lversions = new HashSet(0);
     private Set indexses = new HashSet(0);
     private Set detailpics = new HashSet(0);
     private Set saleses = new HashSet(0);
     private Set parameters = new HashSet(0);
     private Set laptoppics = new HashSet(0);


    // Constructors

    /** default constructor */
    public Laptop() {
    }

    
    /** full constructor */
    public Laptop(Series series, String lname, Integer lsales, Timestamp ltime, Set lversions, Set indexses,  Set detailpics, Set saleses, Set parameters, Set laptoppics, Set mycarts, Set mycollects) {
        this.series = series;
        this.lname = lname;
        this.lsales = lsales;
        this.ltime = ltime;
        this.lversions = lversions;
        this.indexses = indexses;
        this.detailpics = detailpics;
        this.saleses = saleses;
        this.parameters = parameters;
        this.laptoppics = laptoppics;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Series getSeries() {
        return this.series;
    }
    
    public void setSeries(Series series) {
        this.series = series;
    }

    public String getLname() {
        return this.lname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }

    public Integer getLsales() {
        return this.lsales;
    }
    
    public void setLsales(Integer lsales) {
        this.lsales = lsales;
    }

    public Timestamp getLtime() {
        return this.ltime;
    }
    
    public void setLtime(Timestamp ltime) {
        this.ltime = ltime;
    }

    public Set getLversions() {
        return this.lversions;
    }
    
    public void setLversions(Set lversions) {
        this.lversions = lversions;
    }

    public Set getIndexses() {
        return this.indexses;
    }
    
    public void setIndexses(Set indexses) {
        this.indexses = indexses;
    }


    public Set getDetailpics() {
        return this.detailpics;
    }
    
    public void setDetailpics(Set detailpics) {
        this.detailpics = detailpics;
    }

    public Set getSaleses() {
        return this.saleses;
    }
    
    public void setSaleses(Set saleses) {
        this.saleses = saleses;
    }

    public Set getParameters() {
        return this.parameters;
    }
    
    public void setParameters(Set parameters) {
        this.parameters = parameters;
    }

    public Set getLaptoppics() {
        return this.laptoppics;
    }
    
    public void setLaptoppics(Set laptoppics) {
        this.laptoppics = laptoppics;
    }









}