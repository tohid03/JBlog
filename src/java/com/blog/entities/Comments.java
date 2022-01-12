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
public class Comments {
    private int id;
    private String comment;
    private int postId;
    private int userId;
    private Timestamp commentOn;

    public Comments(int id, String comment, int postId, int userId, Timestamp commentOn) {
        this.id = id;
        this.comment = comment;
        this.postId = postId;
        this.userId = userId;
        this.commentOn = commentOn;
    }

   

    public Comments(String comment, int postId, int userId) {
        this.comment = comment;
        this.postId = postId;
        this.userId = userId;
        
    }

    public Comments() {
    }
    
    

//    getters & setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
     public Timestamp getCommentOn() {
        return commentOn;
    }

    public void setCommentOn(Timestamp commentOn) {
        this.commentOn = commentOn;
    }
}
