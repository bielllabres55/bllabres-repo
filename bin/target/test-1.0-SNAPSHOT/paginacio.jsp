<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Rpg Card Generator</title>
 <link rel="stylesheet" href="css/styles.css" type="text/css" />
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
          out.print(" <a href=VisualitzarCartes.jsp?pagina="+i+">"+i+"</a> ");
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
	while(rs.next()) {
	//mostramos los resultados obtenidos
	//out.println(rs.getString("ID_carta"));
	//String nom=request.getParameter("nom");
	out.print(rs.getString("NOM_carta"));%>
	
	<br>
	race:<%out.print(rs.getString("RACE_carta")); %><br>
	FUE:<%out.print(rs.getString("FUE_carta")); %><br>
	DES:<%out.print(rs.getString("DES_carta")); %><br>
	CON:<%out.print(rs.getString("CON_carta")); %><br>
	INT:<%out.print(rs.getString("INT_carta")); %><br>
	SAB:<%out.print(rs.getString("SAB_carta")); %><br>
	CAR:<%out.print(rs.getString("CAR_carta")); %><br>
	PV:<%out.print(rs.getString("PV_carta")); %><br>
	<table width="<%out.print(rs.getString("PV_carta")); %>" bgcolor="red"><tr><td></td></tr></table>
	PM:<%out.print(rs.getString("PM_carta")); %><br>
	<table width="<%out.print(rs.getString("PM_carta")); %>" bgcolor="blue"><tr><td></td></tr></table>
	<br>
	<img src="img/<%out.print(rs.getString("PIC_carta")); %>.png" height="100" width="80">
	<br>
<% 
	}
	//cerramos la conexión
	rs.close();
	}catch(SQLException error) {
	out.print("Error de Conexión : "+error.toString());
	}  


	
	%>
