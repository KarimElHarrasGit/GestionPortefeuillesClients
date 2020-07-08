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
    </head>

    
    <form action="j_security_check" method=post>
        <p><strong>Nom d'utilisateur : </strong>
            <input type="text" name="j_username" size="25">
        </p>
        <p><strong>Mot de passe : </strong>
            <input type="password" size="15" name="j_password">
        </p>
        <input type="submit" value="Soumettre">
        <input type="reset" value="Réinitialiser">
    </form>
</html>