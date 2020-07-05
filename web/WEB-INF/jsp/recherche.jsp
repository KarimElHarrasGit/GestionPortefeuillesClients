<%-- 
    Document   : recherche
    Created on : 7 juin 2019, 11:52:07
    Author     : faycal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recherche</title>
        <style><%@include file="/WEB-INF/css/styles.css"%></style>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <form name="recherche" action="rechercher.htm" method="POST">
            <p>
                <label for="nom">Identifiant du client</label>
                <input type="text" name="identifiant_client"  size="30" id="identifiant_client" />
            </p>
            <p>
                <label for="nom">Nom du client</label>
                <input type="text" name="nom_client" value="" size="30" id="nom_client" />
            </p>
            <input type="submit" value="Rechercher" />
        </form>

    </body>
</html>
