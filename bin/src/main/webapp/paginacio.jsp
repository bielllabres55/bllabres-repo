<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/pagination.css" type="text/css" />
</head>
<h1 class="titol">Visualitzar cartes</h1>
 <ul class="breadcrumb">
  <li><a href="index.jsp">Inici</a></li>
  <li>Visualitzar cartes</li>
</ul> 
<br><br>
<%//  variables per fer la connexio:
	String user="m8";
	String password="toor";
	String host="192.111.0.100";
	String db = "rpg";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	Statement num_registres=null;
	ResultSet rs = null;
	ResultSet num_reg=null;
	int inicio;
	
	//Limito la busqueda
	int TAMANO_PAGINA = 4;

	//examino la página a mostrar y el inicio del registro a mostrar
	String pag = request.getParameter("page");

	if (pag == null) {
		pag = "1";
	}

	int pagina=Integer.parseInt(pag);
	if (pagina==0) {
	   	inicio = 0;
	    pagina=1;
	}
	else {
	    inicio = (pagina - 1) * TAMANO_PAGINA;
	}

	/**
	//miro a ver el número total de campos que hay en la tabla con esa búsqueda
**/
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
num_registres = conn.createStatement();
//inmediatamente hacemos una consulta sencilla
//creamos la consulta
num_reg = num_registres.executeQuery("SELECT * FROM Carta");
int num_total_registros=0;
while(num_reg.next()) {
	num_total_registros++;
}

//calculo el total de páginas
int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

//pongo el número de registros total, el tamaño de página y la página que se muestra

out.print("Nombre de registres trobats:"+num_total_registros+"<br>");
out.print("Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna<br>");
out.print("Mostrant la pàgina "+pagina+" de "+total_paginas+"<p><br>");




//out.print("<a href=VisualitzarCartes.jsp?pagina=2>"+2+"</a> ");
if (total_paginas > 1){
    for (int i=1;i<=total_paginas;i++){
       if (pagina == i)
          //si muestro el índice de la página actual, no coloco enlace
          out.print(pagina);
       else
          //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
          out.print(" <a href=paginacio.jsp?page="+i+">"+i+"</a> ");
    }
}
out.print("<br><br>");
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence="SELECT * from Carta limit "+inicio+","+TAMANO_PAGINA;
	rs = statement.executeQuery(sentence);
	//leemos la consulta

%>
<div class="card-list">
<%

	while(rs.next()) {
		Character aux = new Character();
		aux.setName(rs.getString("name"));
		aux.setRace(rs.getInt("race"));
		aux.setStr(rs.getInt("str"));
		aux.setModStr(rs.getInt("modStr"));
		aux.setDex(rs.getInt("dex"));
		aux.setModDex(rs.getInt("modDex"));
		aux.setCon(rs.getInt("con"));
		aux.setModCon(rs.getInt("con"));
		aux.setIntel(rs.getInt("intel"));
		aux.setModIntel(rs.getInt("modIntel"));
		aux.setSab(rs.getInt("sab"));
		aux.setModSab(rs.getInt("modSab"));
		aux.setCar(rs.getInt("car"));
		aux.setModCar(rs.getInt("modCar"));
		aux.setPm(rs.getInt("pm"));
		aux.setPv(rs.getInt("pv"));
%>
	<%=
		aux.toHTML()
	%>

<%
	}
    %>
</div>
<%
	//cerramos la conexión
	rs.close();
	}catch(SQLException error) {
	out.print("Error de Conexión : "+error.toString());
	}  


	
	%>
