/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Jblog.dao;

import com.Jblog.entities.Category;
import com.Jblog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SuDo
 */
public class Post_dao {

    private Connection con;

    public Post_dao(Connection con) {
        this.con = con;
    }

    //get categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "select * from categories";
            PreparedStatement pst = this.con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery(sql);
            while (rs.next()) {
                int cId = rs.getInt("cId");
                String cName = rs.getString("cName");
                String cDesc = rs.getString("cDescription");
                Category cat = new Category(cId, cName, cDesc);
                list.add(cat);
            }

        } catch (Exception e) {
            System.out.print(e);
        }
        return list;
    }

    //get Category by postId
    public Category getCategoryByCatId(int catId) {
        Category cat = null;
        try {
            String sql = "select * from categories where cId = ?";
            PreparedStatement pst = this.con.prepareStatement(sql);
            pst.setInt(1, catId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                cat = new Category();
                cat.setcId(rs.getInt("cId"));
                cat.setcName(rs.getString("cName"));
                cat.setcDescription("cDescription");

            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return cat;

    }

    //Svae post to database.
    public boolean savePost(Post post) {
        boolean f = false;
        try {
            String qry = "insert into post(pTitle,pContent,pImage,catId,userId) values(?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(qry);
            pst.setString(1, post.getpTitle());
            pst.setString(2, post.getpContent());
            pst.setString(3, post.getpImage());
            pst.setInt(4, post.getCatId());
            pst.setInt(5, post.getUserId());
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    //Extract post data from result set..
    private Post extractPost(ResultSet rs) throws SQLException {
        Post post = new Post();
        post.setpId(rs.getInt("pid"));
        post.setpTitle(rs.getString("pTitle"));
        post.setpContent(rs.getString("pContent"));
        post.setpImage(rs.getString("pImage"));
        post.setpCreatedOn(rs.getTimestamp("pCreatedOn"));
        post.setCatId(rs.getInt("catId"));
        post.setUserId(rs.getInt("userId"));

        return post;
    }

    // Get All Post
    public List<Post> getAllPost() {
        List<Post> post = new ArrayList<>();
        try {
            String qry = "select * from post order by pid desc";
            PreparedStatement pst = this.con.prepareStatement(qry);
            ResultSet rs = pst.executeQuery(qry);
            while (rs.next()) {
                Post p = extractPost(rs);
                post.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    // Get Post By Category Id.
    public List<Post> getPostByCategory(int catId) {
        List<Post> post = new ArrayList<>();
        try {
            String qry = "select * from post where catId =?";
            PreparedStatement pst = this.con.prepareStatement(qry);
            pst.setInt(1, catId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Post p = extractPost(rs);
                post.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    //Get Post By UserId.
    public List<Post> getPostByUser(int userId) {
        List<Post> post = new ArrayList<>();
        try {
            String qry = "select * from post where userId = ?";
            PreparedStatement pst = this.con.prepareStatement(qry);
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Post p = extractPost(rs);
                post.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    //Update Post by Post ID
    public boolean UpdatePost(Post post) {
        boolean f = false;
        try {
            String qry = "Update  post set pTitle =?, pContent=?,pImage=?,catId=? where pid=?";
            PreparedStatement pst = this.con.prepareStatement(qry);
            pst.setString(1, post.getpTitle());
            pst.setString(2, post.getpContent());
            pst.setString(3, post.getpImage());
            pst.setInt(4, post.getCatId());
            pst.setInt(5, post.getpId());
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

  
   public Post getPostById(int pId) {
    Post post = null;
    try {
        String qry = "select * from post where pid = ?";
        PreparedStatement pst = this.con.prepareStatement(qry);

        pst.setInt(1, pId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            post = extractPost(rs);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return post;
}
  //get Post by Title

    public List<Post> searchPost(String query) {
        List<Post> post = new ArrayList<>();
        try {
            String qry = "select * from post where pTitle LIKE ?";
            PreparedStatement pst = this.con.prepareStatement(qry);

            pst.setString(1, "%" + query + "%");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Post p = extractPost(rs);
                post.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    public boolean deletePostById(int pId){
        boolean status = false;
        try {
            String sql = "DELETE FROM post WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pId);
            
            int count = ps.executeUpdate();
            if (count > 0) {
                // deletion successful
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

}
