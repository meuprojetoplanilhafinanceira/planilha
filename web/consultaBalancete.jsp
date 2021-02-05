<%-- 
    Document   : consultalocacao
    Created on : 13 de nov de 2020, 08:17:15
    Author     : entra21
--%>

<%@page import="Modelos.Receita"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 70%;
            }
            td, th {
                border: 1px solid #B0E0E6;
                text-align: center;
                padding: 7px;
            }
            tr:nth-child(even) {
                background-color: #B0E0E6;
            }
        </style>
    </head>
    <body>
        <%
          List<Receita> receitas = new ArrayList<>();
          String descricao = request.getParameter("descricao");
          if(descricao != null){
            Receita receita = new Receita();
            receitas = receita.consultar();
          }
        %>
        <script src="scripts/menu.js"></script>
        <link rel="stylesheet" href="style/estilos.css">
        <h1>Consulta Balancete</h1>
        <hr />
            <table>
                <thead>
                  <th>Id</th> 
                  <th>Descricao</th>
                  <th>Valor</th>
                  <th>Data</th>
              
                </thead>
                <tbody>
                    <%for(Receita r: receitas){%>
                        <tr>
                            <td><%out.write(""+r.getId());%></td>
                            <td><%out.write(r.getDescricao());%></td>
                            <td><%out.write(String.valueOf(r.getValor()));%></td>
                            <td><%out.write(String.valueOf(r.getData()));%></td>
                           
                    </tr>   
                    <%}%>
                </tbody>    
            </table>
            
        </form>
        
    </body>
</html>
