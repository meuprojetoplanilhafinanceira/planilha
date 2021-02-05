<%-- 
    Document   : editarCategoria
    Created on : 8 de nov de 2020, 21:09:00
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:rgba(0, 0, 242, 0.1)">
     <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="style/estilos.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
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
            <a href="#"><i class="fa fa-envelope"></i> </a>
            <a href="#"><i class="fa fa-user"></i></a>
            <a href="#"><i class="fa fa-cog"></i></a>
        </div>
        </div>
        <div class="painel"> Painel de Controle </div><br>
        
        <div class="menu">
        <div class="clearfix">
        <div class="column">
        <ul>
            <li><a href="menu.jsp" ><i class="fa fa-users fa-fw"></i>  MENU </a></li>
            <li><a href="cadastroDespesa.jsp"><i class="fas fa-comments-dollar"></i>  Seu novo Gasto</a> </li>
            <li><a href="cadastroReceita.jsp"><i class="fas fa-donate"></i>  Sua nova Renda</a></li>
            <li><a href="cadastroCategoria.jsp"><i class="fas fa-clipboard"></i>  Crie nova Categoria</a></li>
            <li><a href="consultaBalancete.jsp"><i class="fas fa-balance-scale"></i>  Resumo Financeiro</a></li>
            <li><a href="#"><i class="fa fa-bell fa-fw"></i>  Meus Dados</a></li>
            <li><a href="#"><i class="fa fa-cog fa-fw"></i>  Configurações</a></li>
        </ul>
        </div>
        </div>
        </div>
        <div class="cadcat1"><h1>Editar a sua Categoria</h1>
             <br>
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    int idUser = Integer.parseInt(request.getParameter("idUser"));
                    Categoria categoria = new Categoria();
                    if (id != 0 && idUser != 0) {
                        categoria = categoria.consultar(id, idUser);
                    }
                %>
                <form action="recebeEditaCategoria.jsp" method="POST">
                    
                    <input type="hidden" name="id" readonly="true"
                           value="<%out.write(""+categoria.getId());%>"/>
                    <input type="hidden" name="idUser" readonly="true"
                           value="<%out.write(""+categoria.getIdUsuario());%>"/>
                    <br />
                    
                    <label>Categoria</label>
                    <select id="tipo" name="tipo">
                        <% if (categoria.getTipo().contains("D")) { %>
                                <option value="D" selected>DESPESA</option>
                                <option value="R">RECEITA</option>
                        <%}%>
                        <% if (categoria.getTipo().contains("R")) { %>
                                <option value="D">DESPESA</option>
                                <option value="R" selected>RECEITA</option>
                        <%}%>
                    </select> 
                    <br>
                    <label>Descrição</label>
                    <input type="text" name="descricao" 
                           value="<%out.write(categoria.getDescricao());%>"/> 
                    <br>
                    <br>
                    <input class="cancelar" type="submit" value="Alterar" />
                </form>
        </div>
        <footer>
             <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>             
                 
    </body>
</html>
