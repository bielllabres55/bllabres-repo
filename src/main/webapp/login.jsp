<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>						
					<%
					String user_name=request.getParameter("user");
					String user_pass=request.getParameter("pass");
					String captcha=request.getParameter("captcha");
					
					if (captcha == null || captcha == "crobot") {
						response.sendRedirect("./index.jsp");
					}
							
					String user="m8";
					String password="toor";
					String host="192.111.0.100";
					String db = "rpg";
					String url = "jdbc:mysql://"+host+"/"+db;
					Connection conn = null;
					Statement statement = null;
					ResultSet rs = null;
					
					Class.forName("com.mysql.jdbc.Driver").newInstance ();
					conn = DriverManager.getConnection(url, user, password);
					statement = conn.createStatement();
					//inmediatamente hacemos una consulta sencilla
					//creamos la consulta							
					rs = statement.executeQuery("SELECT * FROM User WHERE name = '"+user_name+"' and password = '"+user_pass+"'");
					if (!rs.first()) {
						response.sendRedirect("./index.jsp");
					} else {
						response.sendRedirect("./home.jsp?user=" + rs.getInt("id"));
					}
					%>
				})
			})
		}
</body>
</html>