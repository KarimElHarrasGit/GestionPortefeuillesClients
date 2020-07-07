<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1><%=request.getAttribute("confirm")%> </h1>
    </body>
</html>
