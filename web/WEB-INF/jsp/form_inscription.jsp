<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enregistrement</title>
    </head>
    <body>
        <%@page import="java.util.*" %>
        <%@page import="model.*" %>
        <jsp:useBean id="cp" class="beans.resultatrequete" scope="request" />
        <jsp:useBean id="dc" class="beans.resultatrequete" scope="request" />
        <form name="inscription" action="enregistrerClient.htm" method="POST">
            <p>
                <label for="nom">Nom</label>
                <input type="text" name="nom" value="" size="10" id="nom" />
            </p>
            <p>
                <label for="adresse">Adresse</label>
                <input type="text" name="adresse" value="" size="10" id="adresse" />
            </p>
            <p>
                <label for="telephone">Téléphone</label>
                <input type="text" name="telephone" value="" size="10" id="tel" />
            </p>
            <p>
                <label for="email">E-mail</label>
                <input type="text" name="email" value="" size="10" id="email"/>
            </p>
            <p><label for="code_remise">Code Remise</label>
                <select name="code_remise" id="dc" >
                    <% List<Object> res = dc.getResult();
                        for (Object enreg1 : res) {
                            out.println("<option>" + (Character) enreg1 + "</option>");
                        }
                    %>
                </select>
            </p>
            <p>
                <label for="cp">Code Postal</label>
                <select name="CP" id="cp">
                    <% for (Object enreg2 : cp.getResult()) {
                            out.println("<option>" + ((MicroMarket) enreg2).getZipCode() + "</option>");
                        }
                    %>
                </select>

            </p>
            <input type="submit" value="Enregistrer" />
        </form>
    </body>
</html>
