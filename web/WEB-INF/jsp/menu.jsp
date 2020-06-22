<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <h1>choisissez une opération dans la liste suivante</h1>
        <form name="afficher" action="afficherClients.htm" method="POST">
            <p> <input type="submit" value="Afficher tous les clients"  /></p>
        </form>
        <form name="inserer" action="afficherFormInscriptionClient.htm" method="POST">
            <p> <input type="submit" value="Inserer un client"  /></p>
        </form>
        <form name="rechercher" action="rechercher.htm" method="POST">
            <p> <input type="submit" value="rechercher un enregistrement"  /></p>
        </form>
    </body>
</html>
