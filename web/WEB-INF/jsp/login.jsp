<%-- 
    Document   : login.jsp
    Created on : 19 juin 2020, 15:35:34
    Author     : kelharra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Authentification</title>
        <style><%@include file="/WEB-INF/css/styles.css"%></style>
    </head>

    
    <form action="j_security_check" method=post>
        <p><label>Nom d'utilisateur </label>
            <input type="text" name="j_username" size="25">
        </p>
        <p><label>Mot de passe </label>
            <input type="password" size="15" name="j_password">
        </p>
        <input type="submit" value="Soumettre">
        <input type="reset" value="Réinitialiser">
    </form>
</html>