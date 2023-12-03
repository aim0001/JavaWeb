<%-- 
    Document   : listepersonne
    Created on : 26 nov. 2023, 09:50:16
    Author     : Lenov
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="app.pk.UtilConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Liste des Personnes</title>
    </head>
    <body>
        <% if(request.getAttribute("msg")!=null){ %>
        <h2><%= request.getAttribute("msg") %></h2>
        <%}%>
        <h1>Listes Personnes</h1>
        
        <a href="/CRUDPerso/HTML/Ajouter.html">Ajouter +</a>
        
        <form action="/CRUDPerso/rechercher" method="GET">
            <input type="text" name="recherche" placeholder="Rechercher..." class="input"/>
            <input type="submit" value="Rechercher"/>
        </form>
        
        <% 
            String persorechercher = request.getParameter("rechercher");
            Connection con = UtilConnection.seConnecter();
            ResultSet rs;
            
            if (persorechercher != null && !persorechercher.isEmpty()) {
                
                rs = con.createStatement().executeQuery("SELECT * FROM personne WHERE nom LIKE '%" + persorechercher + "%'");
            } else {
                
                rs = con.createStatement().executeQuery("SELECT * FROM personne");
            }
        %>
        <table class="table-secondary">
            <tr class="table-secondary"><th>ID</th><th>Nom</th><th>Prenom</th><th>Age</th><th>Supprimer</th><th>Modifier</th></tr>
            
            <% 
                while (rs.next()){
                %>
                <tr><td class="table-secondary"><%=rs.getInt(1) %></td><td class="table-secondary"><%=rs.getString(2) %></td><td class="table-secondary"><%=rs.getString(3) %><td class="table-secondary"><%=rs.getInt(4) %></td>
                    <td class="table-secondary"><a href="/CRUDPerso/Delete?id=<%=rs.getInt(1) %>">supprimer</a></td>
                    <td class="table-secondary"><a href="/CRUDPerso/JSP/updetperso.jsp?id=<%=rs.getInt(1) %>">modifier</a></td>
                </tr>
                <%
                }
                rs.close();
                con.close();
            %>
        </table>
    </body>
</html>
