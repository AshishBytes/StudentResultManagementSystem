package com.ashish;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
   public ConnectionProvider() {
   }

   public static Connection getCon() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/result", "root", "password");
         return con;
      } catch (Exception var1) {
         System.out.println(var1);
         return null;
      }
   }
}