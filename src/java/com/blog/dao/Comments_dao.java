/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.dao;

import com.blog.entities.Comments;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SuDo
 */
public class Comments_dao {
     private Connection con;

    public Comments_dao(Connection con) {
        this.con = con;
    }
    
    //insert Comments.
    public boolean addComment(Comments comment){
         boolean f = false;
        try {
            String qry = "insert into post_comments(comment,postId,userId) values(?,?,?)";
             PreparedStatement pst = this.con.prepareStatement(qry);
             pst.setString(1, comment.getComment());
             pst.setInt(2, comment.getPostId());
             pst.setInt(3,comment.getUserId());
             pst.executeUpdate();
             f = true;
        }catch(Exception e){
            System.out.println(e);
        }
        return f;
    }
    
    //get comments by postid
    public List<Comments> getComments(int postId){
        List<Comments> comments = new ArrayList<>();
        try{
            String qry = "select * from post_comments where postId=? order by id desc";
            PreparedStatement pst = this.con.prepareStatement(qry);
            pst.setInt(1, postId);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Comments cmt = new Comments();
                cmt.setId(rs.getInt("id"));
                cmt.setComment(rs.getString("comment"));
                cmt.setPostId(rs.getInt("postId"));
                cmt.setUserId(rs.getInt("userId"));
                cmt.setCommentOn(rs.getTimestamp("commentOn"));
                comments.add(cmt);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return comments;
    }
    
}
