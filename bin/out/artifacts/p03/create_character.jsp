<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear personatge!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/createCharForm.css" />
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
                        <a class="nav-link" href="paginacio.jsp">Llistat de cartes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Crear cartes</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <h1>Creació de personatges</h1>
    <div class="creator-container">
        <form action="insert_bd.jsp">
            <p class="values">Valors generats: </p>
            <div id="basicData">
                <select required name="race"></select>
                <input required type="text" name="name" placeholder="Nom"/>
            </div>
            <div id="statsData">
                <div><label for="str">STR </label><select id="str" required class="attr" name="str"></select></div>
                <div><label for="str">DES </label><select id="dex" required class="attr" name="dex"></select></div>
                <div><label for="str">CON </label><select id="con" required class="attr" name="con"></select></div>
                <div><label for="str">INT </label><select id="int" required class="attr" name="int"></select></div>
                <div><label for="str">SAB </label><select id="sab" required class="attr" name="sab"></select></div>
                <div><label for="str">CAR </label><select id="car" required class="attr" name="car"></select></div>
            </div>
            <input hidden name="pv" type="range" min="0" id="pvInput">
            <input hidden name="pm" type="range" min="0" id="pmInput">
            <button class="btn btn-outline-dark" disabled type="submit">Guardar personatge!</button>
        </form>
        <table id="character">
            <caption>null</caption>
            <tr>
                <th rowspan="9"><img id="race-img" src="img/0.png"/></th>
                <th>Carac.</th>
                <th>Valor Base</th>
                <th>Mod.</th>
                <th>Valor Final</th>
            </tr>
            <tr class="stat">
                <td>FUE:</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
            </tr>
            <tr class="stat">
                <td>DES:</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
            </tr>
            <tr class="stat">
                <td>CON:</td>
                <td>0</td>
                <td>0</td>
                <td>0
            </tr>
            <tr class="stat">
                <td>INT:</td>
                <td>0</td>
                <td>0</td>
                <td>0
            </tr>
            <tr class="stat">
                <td>SAB:</td>
                <td>0</td>
                <td>0</td>
                <td>0
            </tr>
            <tr class="stat">
                <td>CAR:</td>
                <td>0</td>
                <td>0</td>
                <td>0
            </tr>
            <tr>
                <td>P.V (0)</td>
                <td colspan="3">
                    <hr id="pv" />
                </td>
            </tr>
            <tr>
                <td>P.M (0)</td>
                <td colspan="3">
                    <hr id="pm" />
                </td>
            </tr>
        </table>
    </div>
    <script src="js/create_character.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>