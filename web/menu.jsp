<%-- 
    Document   : menu
    Created on : 28/01/2021, 11:44:21
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
            //verifica sessão
            int idUser = 0;
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>
        <div class="gasto">
        <img src="imagens/gasto1.png">
        <h2>Gastos</h2>
        <ul class="b">
            <li><a href="cadastroDespesa.jsp">Lançar novo Gasto</a> </li>
            <li><a href="consultaDespesa.jsp">Consulta Geral</a></li>
            <li><a href="consultaDespesaDetalhada.jsp">Consulta por Data</a></li>
        </ul>   
        </div>
       
        <div class="renda">
        <img src="imagens/renda1.png">
        <h2>Rendas</h2>
        <ul class="b">
            <li><a href="cadastroReceita.jsp">Lançar nova Renda</a> </li>
            <li><a href="consultaReceita.jsp">Consulta Geral</a></li>
            <li><a href="consultaReceitaDetalhada.jsp">Consulta por Data</a></li>
        </ul>
        </div>
      
        <div class="categoria">
        <img src="imagens/categoria1.png">
        <h2>Categorias</h2>
        <ul class="b">
            <li><a href="cadastroCategoria.jsp">Cadastro</a></li>     
            <li><a href="consultaCategoria.jsp">Consulta</a></li>
        </ul>
        </div>

        <div class="usuario">
        <img src="imagens/usuario1.png">
        <h2>Usuário</h2>
        <ul class="b">   
            <li><a href="consultaUsuario.jsp">Consulta Meus Dados</a></li>
        </ul>
        </div>
        
        <div class="resumo">
        <img src="imagens/resumo1.png">
        <h2>Resumo Financeiro</h2>
        <ul class="b">
            <li><a href="consultaBalancete.jsp"> Meu Saldo </a></li>
        </ul>
        </div>
        
        <footer>
             <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>
       
    </body>
</html>
