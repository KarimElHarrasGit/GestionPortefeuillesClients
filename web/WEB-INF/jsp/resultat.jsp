<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultat</title>
    </head>
    <body>
        <%@page import="java.util.*" %>
        <%@page import="modele.*" %>
        <jsp:useBean id="resultat" class="beans.resultatrequete" scope="request" />
        <form name="Result" action="detailClient.htm" method="POST">
        
            <%            
            out.println("<table border=1 cellpadding=10>") ;
          // resultat.getResult().stream();nouveauté java 8 à creurser 
          List <Object> res=resultat.getResult();//jointure native
            
            for(Object  ligne : res){
                out.println("<TR>");           
                out.println("<TD> <input type=submit value="+String.valueOf(((Customer)ligne).getCustomerId())+" name=Operation /></TD>");
                out.println("<TD>"+((Customer)ligne).getName()+"</TD>");
                out.println("<TD>"+((Customer)ligne).getZip()+"</TD>");
                out.println("<TD>"+((Customer)ligne).getAddressline1()+"</TD>");
                out.println("<TD>"+((Customer)ligne).getDiscountCode()+"</TD>");
                out.println("<TD>"+((Customer)ligne).getEmail()+"</TD>");
                /*jointure réalisée par mappng xml
                out.println("<TD>"+((Customer)resultat.getResult().get(i)).getName()+"</TD>");
                out.println("<TD>"+((Customer)resultat.getResult().get(i)).getDiscountCode().getRate()+"</TD>");*/
                 out.println("</TR>");
                
                
            }
            out.println("</table>");
          
        %>
        </form>
    </body>
</html>
