<%-- 
    Document   : editarCategoriaDefault
    Created on : 8 de nov de 2020, 21:09:00
    Author     : Paulo
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:rgba(0, 0, 242, 0.1)">
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        
    </head>
    <body>
        
        
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
    
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:76px">
        <h3> Olá,
            <% 
              String nomeUser = (String) session.getAttribute("nome");
              out.write(nomeUser);
            %> !!
        <h3>
        <div class="topnav a">
            <a href="#"><img src="imagens/envelope.png"></i> </a>
            <a href="login.jsp"><img src="imagens/usuario.png"></i></a>
            <a href="cadastroCategoriaDefault.jsp"><img src="imagens/configura.png"></i></a>
        </div>
        </div>
        
        <div class="painel"> Painel de Controle </div><br>
        
        <div class="menu">
        <div class="clearfix">
        <div class="column">
        <ul>
            <li><a href="menu.jsp" ><img src="imagens/menu.png" hspace="4">  MENU </a></li>
            <li><a href="cadastroDespesa.jsp"><img src="imagens/gasto.png" hspace="3">  Seu novo Gasto</a> </li>
            <li><a href="cadastroReceita.jsp"><img src="imagens/renda.png" hspace="3">  Sua nova Renda</a></li>
            <li><a href="cadastroCategoria.jsp"><img src="imagens/categoria.png" hspace="3">   Crie nova Categoria</a></li>
            <li><a href="consultaBalancete.jsp"><img src="imagens/resumo.png" hspace="3">  Resumo Financeiro</a></li>
            <li><a href="consultaUsuario.jsp"><img src="imagens/usuario.png" hspace="3">  Meus Dados</a></li>
            <li><a href="consultaCategoriaDefault.jsp"><img src="imagens/configura.png" hspace="3">  Configurações</a></li>
        </ul>
        </div>
        </div>
        </div>
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
