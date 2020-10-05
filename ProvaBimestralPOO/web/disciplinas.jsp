<%-- 
    Document   : disciplinas
    Created on : 5 de out de 2020, 00:55:52
    Author     : Luiz Livio
--%>

<%@page import="br.edu.fatecpg.poo.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf"%>
        <% 
            if (request.getParameter("botaoAlterar") != null){
                int i = Integer.parseInt(request.getParameter("i"));
                float notaEdit = Float.parseFloat(request.getParameter("nota"));
                if (notaEdit < 0){
                    notaEdit = 0;
                } else if (notaEdit > 10){
                    notaEdit = 10;
                }
                Disciplina disciplina = Disciplina.getList().get(i);
                disciplina.setNota(notaEdit);
            }
        
        %>
        <div>
            <h1 style="text-align: center">Disciplinas</h1>
        </div>
        <table class="table">
            <thead style='text-align: center'>
                <th>Disciplina</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
                <th>Alterar Nota</th>
            </thead>
            
            <% 
                for (int i = 0; i < Disciplina.getList().size();i++){
                    Disciplina disciplina = Disciplina.getList().get(i); %>
                    <tr>
                        <td style='text-align: center'><%= disciplina.getNome() %></td>
                        <td><%= disciplina.getEmenta() %></td>
                        <td><%= disciplina.getCiclo() %></td>
                        <td><%= disciplina.getNota() %></td>
                        <td>
                            <form method="get">
                                <div>
                                    <input type="text" name="nota" value="<%= disciplina.getNota() %>"/>
                                    <input type="submit" name="botaoAlterar" class="btn btn-primary mb-2" value="Alterar!"/>
                                    <input type="hidden" name="i" value="<%= i %>"/>
                                </div>
                            </form>
                        </td>
                    </tr>
                <%}%>
            
        </table>
    <%@include file="WEB-INF/jspf/body-scripts.jspf"%>
    </body>
</html>
