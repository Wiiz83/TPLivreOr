<%@page import="bd.bd"%>
<%@page import="metier.MessageDor"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Le livre d'or</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Source code generated using layoutit.com">
        <meta name="author" content="LayoutIt!">

        <link href=./css/style.css rel=stylesheet>
        <link href="./css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            ArrayList<MessageDor> liste = bd.lireMessage();

            String msginfo = (String) request.getAttribute("messageInfo");
            String msgerreur = (String) request.getAttribute("messageErreur");
        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">

                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button> <a class="navbar-brand" href="Index">Livre d'or</a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a href="Index">Accueil</a>
                                </li>

                                <li>
                                    <a href="Saisir">Ajouter</a>
                                </li>
                                <li class="active">
                                    <a href="SelectionS">Supprimer</a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <form class="navbar-form" role="search" method="post" action="Recherche">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name='Contenu'>
                                    </div> 
                                    <button type="submit" class="btn btn-default">
                                        Rechercher
                                    </button>
                                </form>
                            </ul>
                        </div>

                    </nav>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <%
                        if (msginfo != null) {
                            out.println("<p style='background-color: green; color:white; font-weight: bold; padding: 10px;'>" + msginfo + "</p>");
                        }

                        if (msgerreur != null) {
                            out.println("<p style='background-color: red; color:white; font-weight: bold; padding: 10px;'>" + msgerreur + "</p>");
                        }
                    %>
                    <form id='f_supprimer' method="post" action="Confirmation">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="col-md-1">
                                        Choisir
                                    </th>
                                    <th class="col-md-2">
                                        Num�ro
                                    </th>
                                    <th class="col-md-3">
                                        Pseudo
                                    </th>
                                    <th>
                                        Message
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (MessageDor m : liste) {
                                        out.println("<tr>");
                                        out.println("<td><input type='checkbox' name='Checkboxe' value='" + m.getId() + "'/></td>");
                                        out.println("<td>" + m.getId() + "</td>");
                                        out.println("<td>" + m.getPseudo() + "</td>");
                                        out.println("<td>" + m.getMessage() + "</td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>  
                        <button type="submit" class="btn btn-success" value='Supprimer'>Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>

</body>
</html>
