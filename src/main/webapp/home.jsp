<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<html>
    <head>
        <title>RPG M8 P03</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/index.css" type="text/css" rel="stylesheet" />
    </head>
<body>
	<h1>RPG Card Maker</h1>
	<% 
	String user=request.getParameter("user");
	int user_id=Integer.parseInt(user);
	%>
	<main class="">	    
	    <a href="create_character.jsp?user=<%= user_id %>" id="create">Crear Personatge</a>
	    <a href="paginacio.jsp?user=<%= user_id %>" id="see">Veure Cartes</a>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
