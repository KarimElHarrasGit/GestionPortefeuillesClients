<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultat</title>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <%@page import="java.util.*" %>
        <%@page import="model.*" %>
        <jsp:useBean id="resultat" class="beans.resultatrequete" scope="request" />
        <br />
        <form name="Result" action="detailClient.htm" method="POST">

            <%
                out.println("<center><table border=1 cellpadding=10>");
                out.println("<TR>");
                out.println("<TD>Identifiant du client</TD>");
                out.println("<TD>Nom</TD>");
                out.println("<TD>Adresse</TD>");
                out.println("<TD>Téléphone</TD>");
                out.println("<TD>E-mail</TD>");
                out.println("<TD>Code Remise</TD>");
                out.println("<TD>Code Postal</TD>");
                out.println("</TR>");
                // resultat.getResult().stream();nouveauté java 8 à creurser 
                List<Object> res = resultat.getResult();//jointure native

                for (Object ligne : res) {
                    out.println("<TR>");
                    out.println("<TD> <input type=submit value=" + String.valueOf(((Customer) ligne).getCustomerId()) + " name=Operation /></TD>");
                    out.println("<TD>" + ((Customer) ligne).getName() + "</TD>");
                    out.println("<TD>" + ((Customer) ligne).getAddressline1() + "</TD>");
                    out.println("<TD>" + ((Customer) ligne).getPhone() + "</TD>");
                    out.println("<TD>" + ((Customer) ligne).getEmail() + "</TD>");
                    out.println("<TD>" + ((Customer) ligne).getDiscountCode() + "</TD>");
                    out.println("<TD>" + ((Customer) ligne).getZip() + "</TD>");

                    /*jointure réalisée par mappng xml
                out.println("<TD>"+((Customer)resultat.getResult().get(i)).getName()+"</TD>");
                out.println("<TD>"+((Customer)resultat.getResult().get(i)).getDiscountCode().getRate()+"</TD>");*/
                    out.println("</TR>");

                }
                out.println("</table></center>");

            %>
        </form>
    </body>
</html>
