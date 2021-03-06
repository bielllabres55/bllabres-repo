<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>RPG M8 P03</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/index.css" type="text/css" rel="stylesheet" />
    </head>
<body>
	<h1>RPG Card Maker</h1>
	<main class="">
	    <form method="get" action="login.jsp">
	    	<input required name="user" placeholder="Usuari" type="text" />
	    	<input required name="pass" placeholder="Contrasenya" type="password" />
	    	<label for="chuman">I am human</label>
	    	<input id="chuman" type="checkbox" name="captcha" value="human" />
	    	<label for="chuman">I am a robot</label>
	    	<input id="crobot" type="checkbox" name="captcha" value="robot" />
	    	<button type="submit">Entrar</button>
	    </form>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
