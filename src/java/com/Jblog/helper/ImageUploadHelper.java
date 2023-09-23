/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Jblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author SuDo
 */
public class ImageUploadHelper {
    
    
    
    public static boolean saveFile(InputStream is, String path){
        boolean f = false;
        //System.out.println(path);
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            //System.out.println("upload success");
            fos.flush();
            fos.close();    
            f = true;
        } catch (IOException e) {
            System.out.println(e);
            e.printStackTrace();
        }
        
       return f; 
    }
    
    public static boolean deleteFile(String path){ 
        boolean f = false;
        try{
            File file = new File(path);
            f = file.delete();
            
        }catch(Exception e){
            System.out.println(e);
            e.printStackTrace();
        }
        
        return f;
    }
}
