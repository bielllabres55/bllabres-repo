<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String user="m8";
    String password="toor";
    String host="192.111.0.100";
    String db = "rpg";
    String url = "jdbc:mysql://"+host+"/"+db;
    Connection conn = null;
    Statement statement = null;

    int id=Integer.parseInt(request.getParameter("id"));
    String newName=request.getParameter("name");

    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance ();
        conn = DriverManager.getConnection(url, user, password);
        statement = conn.createStatement();
        //inmediatamente hacemos una consulta sencilla
        //creamos la consulta
        String sentence="UPDATE Carta SET name = '" + newName + "'  where id='"+ id+ "'";
        int i = statement.executeUpdate(sentence);
        System.out.println("Data successfully updated!");


        response.sendRedirect("./paginacio.jsp");
    } catch(SQLException error) {
        System.out.print("Error de Conexión : "+error.toString());
        response.sendRedirect("./paginacio.jsp");
    }
%>