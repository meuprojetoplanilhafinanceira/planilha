<%-- 
    Document   : editarCategoriaDefault
    Created on : 8 de nov de 2020, 21:09:00
    Author     : Paulo
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/estilos2.css">
        <title>editarCategoriaDefault</title>
    </head>
    <body>
        <header>
            <!--<script src="scripts/cabecalho.js"></script>-->
        </header>
        <section>
            <nav>
                <!--<script src="scripts/menu.js"></script>-->
            </nav>
            <article>
                <h1>Categoria Default editada!</h1>

                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    CategoriaDefault categoriaDefault = new CategoriaDefault();
                    if (id != 0) {
                        categoriaDefault = categoriaDefault.consultar(id);
                    }
                %>
                <form action="recebeEditaCategoriaDefault.jsp" method="POST">
                    <label>Id</label>
                    <input style="width: 35%" type="text" name="id" readonly="true"
                           value="<%out.write(""+categoriaDefault.getId());%>"/>
                    <br />
                    <label>Descrição</label>
                    <input style="width: 35%" type="text" name="descricao" 
                           value="<%out.write(categoriaDefault.getDescricao());%>"/> 
                    <br /> 
                    <select name="tipo" style="margin-left: 130px;">
                        <% if (categoriaDefault.getTipo().contains("D")) { %>
                                <option value="D" selected>DESPESA</option>
                                <option value="R">RECEITA</option>
                        <%}%>
                        <% if (categoriaDefault.getTipo().contains("R")) { %>
                                <option value="D">DESPESA</option>
                                <option value="R" selected>RECEITA</option>
                        <%}%>
                    </select>
                    <br /> 
                    <input type="submit" value="Alterar" />
                </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>            
    </body>
</html>
