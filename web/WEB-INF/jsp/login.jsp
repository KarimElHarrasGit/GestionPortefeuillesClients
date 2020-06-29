<%-- 
    Document   : login.jsp
    Created on : 19 juin 2020, 15:35:34
    Author     : kelharra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
    </head>

    <h2>Hello, please log in:</h2>
    <br><br>
    <form action="j_security_check" method=post>
        <p><strong>User Name: </strong>
            <input type="text" name="j_username" size="25">
        <p><p><strong>Your Password: </strong>
            <input type="password" size="15" name="j_password">
        <p><p>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
    </form>
</html>