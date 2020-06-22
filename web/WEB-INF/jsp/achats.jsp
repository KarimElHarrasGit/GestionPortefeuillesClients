<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achats</title>
    </head>
    <body>
        <%@page import="java.util.*" %>
        <%@page import="modele.*" %>
        <jsp:useBean id="resultat" class="beans.resultatrequete" scope="request" />
        
        <H1>Achats du client n°<%=request.getParameter("numero")%></H1>
        <%            
            out.println("<table border=1 cellpadding=10>");
                        
           // out.println("<TR>");
            List <Object []> res=resultat.getResult();//jointure native
            
            
           for(Object [] ligne : res){
                out.println("<TR>");
                out.println("<TD>"+((PurchaseOrder)ligne[0]).getShippingDate()+"</TD>");
                out.println("<TD>"+((PurchaseOrder)ligne[0]).getProductId()+"</TD>");
                out.println("<TD>"+((PurchaseOrder)ligne[0]).getQuantity()+"</TD>");
                out.println("<TD>"+((PurchaseOrder)ligne[0]).getShippingCost()+"</TD>");
                out.println("</TR>");
           }
           out.println("<TR>");
           out.println("</table>");
                  
            
        %>
        
    </body>
</html>
