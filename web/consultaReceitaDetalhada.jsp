<%-- 
    Document   : consultaReceitaDetalhada
    Created on : 08/02/2021, 10:54:37
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
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
            int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>   
        
        <h1>Consulta Receita Detalhada</h1>
        <hr />



        <form action="consultaReceitaDetalhada.jsp" method="POST">
            <div class="container">
                <label>Digite a Data Inicial</label>
                <input type="date" name="dataInicio" />


                <label>Digite a Data Final</label>
                <input type="date" name="dataFim" />


                <label>Agrupar?</label>
                <input type="checkbox" name="agrupar" checked="true" />

                <%
                    Categoria cat = new Categoria();
                    List<Categoria> categorias = cat.consultar(idUser, "R");
                %>

                <input type="checkbox" name="filtrarByCategoria"> Filtrar por categoria?</input>
                <select name="categoria">
                    <%for (Categoria ct : categorias) { %>
                    <option value=<%out.write("" + ct.getId());%>><%out.write(ct.getDescricao());%></option>
                    <%}%>
                </select>


                <input type="button" value="Consultar"  onclick="enviaForm()"/>
                <hr/>
            </div>

            <%
                Receita receita = new Receita();
                List<Receita> receitas = new ArrayList<>();
                
                String filtrarByCategoria = request.getParameter("filtrarByCategoria");
                String categoria = request.getParameter("categoria");
               
                String inicio = request.getParameter("dataInicio");
                String fim = request.getParameter("dataFim");
                String agrupar = request.getParameter("agrupar");
                
                if (inicio != null && fim != null) {
                    Date dataInicio = Date.valueOf(inicio);
                    Date dataFim = Date.valueOf(fim);
                    boolean agrupa = false;
                    if (agrupar != null) {
                        agrupa = true;
                    }
                    
                    //busca por categoria
                    if (filtrarByCategoria != null){
                       int idCategoria = Integer.parseInt(categoria);                     
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa, idCategoria);
                    }
                    else
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa);
                }
            %> 


            <%
                if (inicio == null && fim == null) {
                    out.write("<table style='display:none'>");
                } else {
                    if (inicio.isEmpty() && fim.isEmpty()) {
                        out.write("<table style='display:none'>");
                    } else {
                        out.write("<table style='display:block'>");
                    }
                }
            %>
            <thead>
            <th>Descricao</th>
            <th>Valor</th>
            <th>Data</th> 
        </thead> 
        <tbody>
            <% for (Receita r : receitas) {%>

            <tr>
                <td><% out.write(r.getDescricao());%></td>
                <td><% out.write(String.valueOf(r.getValor()));%></td>
                <td><% out.write(String.valueOf(r.getData()));%></td>        
            </tr>
            <%}%>
        </tbody>           
    </table>
</form>
<footer>
    <script src="scripts/rodape.js"></script>
</footer>

<script>
                    function enviaForm() {
                        debugger;
                        var dataInicio = document.getElementsByName("dataInicio")[0];
                        if (dataInicio.value === "") {
                            dataInicio.focus();
                            alert("Informe data de Inicio");
                            return;
                        }
                        var dataFim = document.getElementsByName("dataFim")[0];
                        if (dataFim.value === "") {
                            dataFim.focus();
                            alert("Informe data de Final");
                            return;
                        }
                        document.forms[0].submit();
                    }
</script>

</body>
</html>
