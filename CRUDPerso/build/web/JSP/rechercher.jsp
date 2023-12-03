<%-- 
    Document   : rechercher
    Created on : 3 déc. 2023, 08:51:54
    Author     : Lenov
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>

    <table class="table-secondary">
        <tr class="table-secondary">
            <th>ID</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Age</th>
            <th>Supprimer</th>
            <th>Modifier</th>
        </tr>

        <%
            ResultSet searchResults = (ResultSet) request.getAttribute("searchResults");

            try {
                while (searchResults.next()) {
        %>
                    <tr>
                        <td class="table-secondary"><%=searchResults.getInt(1) %></td>
                        <td class="table-secondary"><%=searchResults.getString(2) %></td>
                        <td class="table-secondary"><%=searchResults.getString(3) %></td>
                        <td class="table-secondary"><%=searchResults.getInt(4) %></td>
                        <td class="table-secondary"><a href="/CRUDPerso/Delete?id=<%=searchResults.getInt(1) %>">supprimer</a></td>
                        <td class="table-secondary"><a href="/CRUDPerso/JSP/updetperso.jsp?id=<%=searchResults.getInt(1) %>">modifier</a></td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (searchResults != null) {
                        searchResults.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
