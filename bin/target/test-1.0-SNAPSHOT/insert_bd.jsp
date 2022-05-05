<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	String user="m8";
	String password="toor";
	String host="192.111.0.100";
	String db = "rpg";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String nom=request.getParameter("name");
	int raceId=Integer.parseInt(request.getParameter("race"));
	String picture=request.getParameter("picture");
	String fue=request.getParameter("str");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("dex");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("pm");
	int npm=Integer.parseInt(pm);

    Character aux = new Character();
    aux.setRace(raceId);

    try{
       Class.forName("com.mysql.jdbc.Driver").newInstance ();
       conn = DriverManager.getConnection(url, user, password);
       statement = conn.createStatement();
       //inmediatamente hacemos un insert amb les dades
       //creamos la consulta
       int i=statement.executeUpdate("insert into Carta values(null,'"+nom+"','"+raceId+"',"+nfue+","+aux.getModStr()+","+ndes+","+aux.getModDex()+","+ncon+","+aux.getModCon()+","+nint+","+aux.getModIntel()+","+sab+","+aux.getModSab()+","+car+","+aux.getModCar()+","+pv+","+pm+")");
       System.out.println("Data successfully inserted!");
       response.sendRedirect("./index.jsp");
    }catch(SQLException error) {
       System.out.print("Error de Conexión : "+error.toString());
    }
%>
