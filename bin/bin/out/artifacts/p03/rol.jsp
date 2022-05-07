<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M8 P03 Joc de Rol</title>
</head>
<body>
	<%!
	
	class Player {
		String name;
		
		// Raza
		String race;
		int raceId;
		
		// Atributos Base
		int modStr;
		int modDex;
		int modCon;
		int modIntel;
		int modSab;
		int modCar;
		
		// Modificadores de atributos
		int str;
		int dex;
		int con;
		int intel;
		int sab;
		int car;
		
		// Puntos de salud y magia
		int pv;
		int pm;

		public Player() {
			this.name = "";
			this.genRace();
			this.genAttributes();
		}
		
		public Player(String name) {
			this.name = name;
			this.genRace();
			this.genAttributes();
		}

		// Asignar una raza al jugador
		private void genRace() {
			String[] races = {
					"Elf", "Nans", "Gnom", "Mitjans", "SemiOrc", "Humans"
			};

			this.raceId = (int) (Math.random() * 6);
			this.race = races[this.raceId];
		}
		
		// Generar los atributos de forma aleatoria
		private void genAttributes() {
			this.str = this.throwDices();
			this.dex = this.throwDices();
			this.con = this.throwDices();
			this.intel = this.throwDices();
			this.sab = this.throwDices();
			this.car = this.throwDices();

			switch (this.raceId) {
				case 0:
					this.modDex = 2;
					this.modCon = -2;
					this.modIntel = 2;
					break;
				case 1:
					this.modCon = 2;
					this.modCar = -2;
					this.modSab = 2;
					break;
				case 2:
					this.modCon = 2;
					this.modStr = -2;
					this.modCar = 2;
					break;
				case 3:
					this.modDex = 2;
					this.modStr = -2;
					break;
				case 4:
					this.modStr = 2;
					this.modIntel = -2;
					this.modCar = -2;
					break;
			}

			this.pv = (this.con + this.modCon) * this.throwDice(8);
			this.pm = (int) Math.floor(((double)this.intel + this.modIntel + this.sab + this.modSab) / 2);
			this.pm *= this.throwDice(4);
		}

		// Lanzar un dado de n caras
		public int throwDice(int faces) {
			return (int) (Math.random() * faces + 1);
		}

		// Lanzar 4 dados y obtener la suma de los 3 mas altos
		public int throwDices() {
			int[] values = new int[4];

			for (int i = 0; i < values.length; i++) {
				values[i] = this.throwDice(6);
			}
			Arrays.sort(values);
			int total = 0;
			for (int i = 1; i < values.length; i++) {
				total += values[i];
			}
			return total;
		}
		
		public int[] throwDices(int numCaras, int numDaws) {
			return null;
		}
	
		// GETTERS
		public String getRace() {
			return race;
		}

		public int getRaceId() {
			return raceId;
		}

		public int getStr() {
			return str;
		}

		public int getDex() {
			return dex;
		}

		public int getCon() {
			return con;
		}

		public int getIntel() {
			return intel;
		}

		public int getSab() {
			return sab;
		}

		public int getCar() {
			return car;
		}

		public int getPv() {
			return pv;
		}

		public int getPm() {
			return pm;
		}

		public int getModStr() {
			return modStr;
		}

		public int getModDex() {
			return modDex;
		}

		public int getModCon() {
			return modCon;
		}

		public int getModIntel() {
			return modIntel;
		}

		public int getModSab() {
			return modSab;
		}

		public int getModCar() {
			return modCar;
		}
	}

	%>

	<% Player player = new Player(); %>
	<style>
		table, td, tr, th {
			border: 1px solid black;
		}
		table {
			width: 750px;	
		}
		table th:first-child {
			width: 200px;
			height: 350px;		
		}
		caption {
			font-weight: bold;
		}
		#race-img {
			max-height: 300px; 
			width: 150px;	
		}		
		hr {
			float: left;
			height: 10px;
		}
		#pv {
			color: red;
			background-color: red;
			width: <%=player.getPv() * 3 %>px;
		}
		#pm {
			color: blue;
			background-color: blue;
			width: <%=player.getPm() * 3%>px;
		}
	</style>

	<table>
		<caption><%= player.getRace() %></caption>
		<tr>
			<th rowspan="9"><img id="race-img" src="img/<%= player.getRaceId()%>.png"/></th>
			<th>Carac.</th>
			<th>Valor Base</th>
			<th>Mod.</th>
			<th>Valor Final</th>
		</tr>
		<tr>
			<td>FUE:</td>
			<td><%= player.getStr()%></td>
			<td><%= player.getModStr()%></td>
			<td><%= player.getStr() + player.getModStr()%></td>
		</tr>
		<tr>
			<td>DES:</td>
			<td><%= player.getDex()%></td>
			<td><%= player.getModDex()%></td>
			<td><%= player.getDex() + player.getModDex()%></td>
		</tr>
		<tr>
			<td>CON:</td>
			<td><%= player.getCon()%></td>
			<td><%= player.getModCon()%></td>
			<td><%= player.getModCon() + player.getCon()%></td>
		</tr>
		<tr>
			<td>INT:</td>
			<td><%= player.getIntel()%></td>
			<td><%= player.getModIntel()%></td>
			<td><%= player.getModIntel() + player.getIntel()%></td>
		</tr>
		<tr>
			<td>SAB:</td>
			<td><%= player.getSab()%></td>
			<td><%= player.getModSab()%></td>
			<td><%= player.getModSab() + player.getSab()%></td>
		</tr>
		<tr>
			<td>CAR:</td>
			<td><%= player.getCar()%></td>
			<td><%= player.getModCar()%></td>
			<td><%= player.getModCar() + player.getCar()%></td>
		</tr>
		<tr>
			<td>P.V (<%=player.getPv()%>)</td>
			<td colspan="3">
				<hr id="pv"/>
			</td>
		</tr>
		<tr>
			<td>P.M (<%=player.getPm()%>)</td>
			<td colspan="3">
				<hr id="pm"/>
			</td>
		</tr>
	</table>
</body>
</html>