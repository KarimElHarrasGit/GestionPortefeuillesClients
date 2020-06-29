<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <h1><%=request.getAttribute("confirm")%> </h1>
        <form action="afficherClients.htm" method="POST">
            <input type="submit" value="Afficher tous les clients" name="Operation" />
        </form>
    </body>
</html>
