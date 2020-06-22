<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <%-- jsp servant de point d'entrée à l'application et redirigeant directement vers le servlet controleur--%>
        <% response.sendRedirect("Controleur");%>
    </body>
</html>
