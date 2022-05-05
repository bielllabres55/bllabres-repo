<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="biel.llabres.Character" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="US-ASCII">
		<title>Rpg Card Generator</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
		<link rel="stylesheet" href="css/pagination.css" type="text/css" />
	</head>
	<body>
		<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">RPG</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="index.jsp">Inici</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" href="#">Llistat de cartes</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="create_character.jsp">Crear cartes</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<h1>Llistat de cartes</h1>
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
			pag = pag == null ? "1" : pag;

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
		String user_id=request.getParameter("user");
		
		num_reg = num_registres.executeQuery("SELECT * FROM Carta");
				
		int num_total_registros=0;
		while(num_reg.next()) {
			num_total_registros++;
		}

		//calculo el total de páginas
		int total_paginas = (int)Math.ceil(((double)num_total_registros/ TAMANO_PAGINA));

		//pongo el número de registros total, el tamaño de página y la página que se muestra

		out.print("<div class='page-info'>");
		out.print("<p>Nombre de registres trobats:"+num_total_registros+"</p>");
		out.print("<p>Es mostren pàgines de "+TAMANO_PAGINA+" registres cadascuna</p>");
		out.print("<p>Mostrant la pàgina "+pagina+" de "+total_paginas+"</p>");
		out.print("</div>");

		out.print("<div class='page-nav'>");
		if (total_paginas > 1){
			for (int i=1;i<=total_paginas;i++){
			   if (pagina == i)
				  //si muestro el índice de la página actual, no coloco enlace
				  out.print("<p>" + pagina + "</p>");
			   else
				  //si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
				  out.print("<a href=paginacio.jsp?page="+i+">"+i+"</a>");
			}
		}
		out.print("</div><br><br>");
		try{

			Class.forName("com.mysql.jdbc.Driver").newInstance ();
			conn = DriverManager.getConnection(url, user, password);
			statement = conn.createStatement();
			//inmediatamente hacemos una consulta sencilla
			//creamos la consulta
			String sentence="SELECT * from Carta where user_id = " + user_id +" limit "+inicio+","+TAMANO_PAGINA;
			rs = statement.executeQuery(sentence);
			//leemos la consulta

		%>
		<div class="card-list">
		<%

			while(rs.next()) {
				Character aux = new Character();
				aux.setId(rs.getInt("id"));
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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="js/update.js"></script>
	</body>
</html>