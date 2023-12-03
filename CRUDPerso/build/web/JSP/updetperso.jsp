<%-- 
    Document   : updetperso
    Created on : 28 nov. 2023, 09:00:37
    Author     : Lenov
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.pk.UtilConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>JSP Page</title>
    </head>
    <body>
        <%  Connection con = UtilConnection.seConnecter();
            PreparedStatement ps = con.prepareStatement( "SELECT * FROM personne where id = ?" );
            
            int id = Integer.parseInt(request.getParameter("id"));
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
        %>
       
            <% 
                if(rs.next()){
                %>
                    <form action="/CRUDPerso/modifierperso" method="post">
                        id :<INPUT type="text" value="<%=rs.getInt(1)%>" disabled> <br>
                        <INPUT type="hidden" name="id" value="<%=rs.getInt(1)%>"> <br>
                        Nom :<INPUT type="text" NAME="nom" value="<%=rs.getString(2)%>"> <br>
                        Prénom :<INPUT type="text" NAME="prenom"value="<%=rs.getString(3)%>"> <br>
                        Age :<INPUT type="text" NAME="age"value="<%=rs.getInt(4)%>"> <br>
                            <INPUT TYPE=SUBMIT VALUE="Modifier">
                    </FORM>

                <%
                }else {
                    %> <b>Joueur introuvable !</b><%
                }  
                rs.close();
                con.close();
          
        %>
                
        
    </body>
</html>
