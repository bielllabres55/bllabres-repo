<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear personatge!</title>
    <script src="js/create_character.js"></script>
    <link rel="stylesheet" type="text/css" href="css/createCharForm.css" />
</head>
<body>
    <h1>Creació de personatges</h1>
    <p>Valors generats: </p>
    <form action="insert_bd.jsp">
        <select required name="race"></select>
        <input required type="text" name="name" placeholder="Nom"/>
        <select required class="attr" name="str"></select>
        <select required class="attr" name="dex"></select>
        <select required class="attr" name="con"></select>
        <select required class="attr" name="int"></select>
        <select required class="attr" name="sab"></select>
        <select required class="attr" name="car"></select>

        <input hidden name="pv" type="range" min="0" max="150" id="pvInput">
        <input hidden name="pm" type="range" min="0" max="150" id="pmInput">
        <button disabled type="submit">Guardar personatge!</button>
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
</body>
</html>