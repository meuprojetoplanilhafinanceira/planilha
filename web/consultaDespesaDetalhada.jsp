<%-- 
    Document   : consultaDespesaDetalhada
    Created on : 08/02/2021, 10:35:42
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
html>
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


        <h1>Consulta Despesa Detalhada</h1>
        <hr />



        <form action="consultaDespesaDetalhada.jsp" method="POST">
            <div class="container">
                <label>Digite a Data Inicial</label>
                <input type="date" name="dataInicio" />


                <label>Digite a Data Final</label>
                <input type="date" name="dataFim" />


                <label>Agrupar?</label>
                <input type="checkbox" name="agrupar" checked="true" />

                <%
                    Categoria cat = new Categoria();
                    //List<Categoria> categorias = cat.consultar(idUser);
                     List<Categoria> categorias = cat.consultar(idUser, "D");
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
                Despesa despesa = new Despesa();
                List<Despesa> despesas = new ArrayList<>();
                //Integer idUser = (int) session.getAttribute("idUser");
               // Integer idUser = 7;
                String filtrarByCategoria = request.getParameter("filtrarByCategoria");
                String categoria = request.getParameter("categoria");
                // String valor = request.getParameter("valor");
                // String data = request.getParameter("data");
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
                    if (filtrarByCategoria != null) {
                        int idCategoria = Integer.parseInt(categoria);
                        despesas = despesa.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa, idCategoria);
                    } else {
                        despesas = despesa.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa);
                    }
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
            <% for (Despesa d : despesas) {%>

            <tr>
                <td><% out.write(d.getDescricao());%></td>
                <td><% out.write(String.valueOf(d.getValor()));%></td>
                <td><% out.write(String.valueOf(d.getData()));%></td>        
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
