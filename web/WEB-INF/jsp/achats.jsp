<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achats</title>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <%@page import="java.util.*" %>
        <%@page import="model.*" %>
        <jsp:useBean id="resultat" class="utils.resultatrequete" scope="request" />

        <H1>Achats du client n°<%=request.getParameter("numero")%></H1>
            <%
                out.println("<center><table border=1 cellpadding=10>");
                out.println("<TR>");
                out.println("<TD>Date d'expédition</TD>");
                out.println("<TD>Identifiant du produit</TD>");
                out.println("<TD>Description du Product</TD>");
                out.println("<TD>Quantité</TD>");
                out.println("<TD>Frais d'envoi</TD>");
                out.println("<TD>Transporteur‎</TD>");
                out.println("</TR>");

                // out.println("<TR>");
                List<Object[]> res = resultat.getResult();//jointure native

                for (Object[] ligne : res) {
                    out.println("<TR>");
                    out.println("<TD>" + ((PurchaseOrder) ligne[0]).getShippingDate() + "</TD>");
                    out.println("<TD>" + ((PurchaseOrder) ligne[0]).getProductId() + "</TD>");
                    out.println("<TD>" + ((Product) ligne[1]).getDescription() + "</TD>");
                    out.println("<TD>" + ((PurchaseOrder) ligne[0]).getQuantity() + "</TD>");
                    out.println("<TD>" + ((PurchaseOrder) ligne[0]).getShippingCost() + "</TD>");
                    out.println("<TD>" + ((PurchaseOrder) ligne[0]).getFreightCompany() + "</TD>");
                    out.println("</TR>");
                }
                out.println("<TR>");
                out.println("</table></center>");


            %>

    </body>
</html>
