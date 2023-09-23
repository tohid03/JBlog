package com.Jblog.entities;

import java.sql.*;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String about;

    private String image;
    private Timestamp createdOn;

//    Constructor
    public User(int id, String name, String email, String password, String about, String image, Timestamp act_created) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.image = image;
        this.createdOn = act_created;
    }

    public User(String name, String email, String password, String about, String image) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.image = image;

    }

//    default constructor
    public User() {
    }

//    Getters & setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Timestamp createdOn) {
        this.createdOn = createdOn;
    }

}
