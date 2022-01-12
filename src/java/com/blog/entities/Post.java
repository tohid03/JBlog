/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author SuDo
 */
public class Post {
    private int pId;
    private String pTitle;
    private String pContent;
    private String pImage;
    private Timestamp pCreatedOn;
    private int catId;
    private int userId;

    public Post(int pId, String pTitle, String pContent, String pImage, Timestamp pCreatedOn, int catId, int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pImage = pImage;
        this.pCreatedOn = pCreatedOn;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pImage, int catId, int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pImage = pImage;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(int pId, String pTitle, String pContent, String pImage, int catId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pImage = pImage;
        this.catId = catId;
    }

    public Post() {
    }
    

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public Timestamp getpCreatedOn() {
        return pCreatedOn;
    }

    public void setpCreatedOn(Timestamp pCreatedOn) {
        this.pCreatedOn = pCreatedOn;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
}
