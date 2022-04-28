<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: biel
  Date: 22/2/22
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%// variables per fer la connexio:
    String user="m8";
    String password="toor";
    String host="192.111.0.100";
    String db = "rpg";
    String url = "jdbc:mysql://"+host+"/"+db;
    Connection conn = null;
    Statement statement = null;
    ResultSet rs = null;

    int id=Integer.parseInt(request.getParameter("id"));

    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection(url, user, password);
        statement = conn.createStatement();
        //inmediatamente hacemos un insert amb les dades
        //creamos la consulta
        int i=statement.executeUpdate("delete from Carta where id='" + id + "'");
        System.out.println("Data is successfully inserted!");
        response.sendRedirect("./paginacio.jsp");
    }catch(SQLException error) {
        System.out.print("Error de Conexión : "+error.toString());
        response.sendRedirect("./paginacio.jsp");
    }
%>