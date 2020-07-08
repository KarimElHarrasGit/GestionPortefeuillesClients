<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <style><%@include file="/WEB-INF/css/styles.css"%></style>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <jsp:useBean id="resultat" class="utils.resultatrequete" scope="request" />
        <jsp:useBean id="dc" class="utils.resultatrequete" scope="request" />
        <jsp:useBean id="zip" class="utils.resultatrequete" scope="request" />
        <%@page import="model.*" %>
        <%@page import="java.util.*" %>


        <form name="inscription" method="POST">
            <p>
                <input type="hidden" name="numero" value="<%=String.valueOf(resultat.getClient().getCustomerId())%>" size="30" id="numero" />
            </p>
            <p>
                <label for="nom">Nom</label>
                <input type="text" name="nom" value="<%=resultat.getClient().getName()%>" size="30" id="nom" />
            </p>
            <p>
                <label for="adresse">Adresse</label>
                <input type="text" name="adresse" value="<%=resultat.getClient().getAddressline1()%>" size="30" id="adresse" />
            </p>
            <p>
                <label for="telephone">Téléphone</label>
                <input type="text" name="telephone" value="<%=resultat.getClient().getPhone()%>" size="30" id="tel" />
            </p>
            <p>
                <label for="email">E-mail</label>
                <input type="text" name="email" value="<%=resultat.getClient().getEmail()%>" size="30" id="email"/>
            </p>
            <p>
                <label for="Remise">Code Remise</label>
                <select name="Remise" id="dc" >
                    <% List<Character> res = dc.getResult();
                        for (Character enreg1 : res) {
                            if (enreg1 == resultat.getClient().getDiscountCode()) {
                                out.println("<option selected=\"selected\">" + enreg1 + "</option>");
                            } else {
                                out.println("<option>" + enreg1 + "</option>");
                            }
                        }
                    %>
                </select>
            </p>

            <p>
                <label for="Code_Postal">Code Postal</label>
                <select name="Code_Postal" id="cp">
                    <% List<MicroMarket> liste = zip.getResult();
                        for (MicroMarket enreg2 : liste) {
                            if (enreg2.getZipCode().equals(resultat.getClient().getZip())) {
                                out.println("<option selected=\"selected\">" + enreg2.getZipCode() + "</option>");
                            } else {
                                out.println("<option>" + enreg2.getZipCode() + "</option>");
                            }
                        }
                    %>
                </select>
            </p>

            <input type="submit" value="Modifier" formaction="modifierClient.htm" />
            <input type="submit" value="Supprimer" formaction="supprimerClient.htm" />
            <input type="submit" value="Afficher les achats" formaction="afficherAchats.htm" />
        </form>


    </body>
</html>
