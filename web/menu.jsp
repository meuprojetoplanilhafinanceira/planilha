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
            <a href="login.jsp"><i class="fa fa-user"></i></a>
            <a href="cadastroCategoriaDefault.jsp"><i class="fa fa-cog"></i></a>
        </div>
        </div>
        
        <div class="painel"> Painel de Controle </div><br>
        
        <div class="menu">
        <div class="clearfix">
        <div class="column">
        <ul>
            <li><a href="menu.jsp" ><i class="fa fa-users fa-fw"></i> MENU </a></li>
            <li><a href="cadastroDespesa.jsp"><i class="fas fa-comments-dollar"></i>  Seu novo Gasto</a> </li>
            <li><a href="cadastroReceita.jsp"><i class="fas fa-donate"></i>  Sua nova Renda</a></li>
            <li><a href="cadastroCategoria.jsp"><i class="fas fa-clipboard"></i>  Crie nova Categoria</a></li>
            <li><a href="consultaBalancete.jsp"><i class="fas fa-balance-scale"></i>  Resumo Financeiro</a></li>
            <li><a href="#"><i class="fa fa-bell fa-fw"></i>  Meus Dados</a></li>
            <li><a href="consultaCategoriaDefault.jsp"><i class="fa fa-cog fa-fw"></i>  Configurações</a></li>
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
        <div class='fas fa-comments-dollar' style='font-size:48px'></div>
        <h2>Gastos</h2>
        <ul class="b">
            <li><a href="cadastroDespesa.jsp">Lançar novo Gasto</a> </li>
            <li><a href="consultaDespesa.jsp">Consulta Geral</a></li>
            <li><a href="consultaDespesaDetalhada.jsp">Consulta por Data</a></li>
        </ul>   
        </div>
       
        <div class="renda">
        <div class='fas fa-donate' style='font-size:48px'></div>
        <h2>Rendas</h2>
        <ul class="b">
            <li><a href="cadastroReceita.jsp">Lançar nova Renda</a> </li>
            <li><a href="consultaReceita.jsp">Consulta Geral</a></li>
            <li><a href="consultaReceitaDetalhada.jsp">Consulta por Data</a></li>
        </ul>
        </div>
      
        <div class="categoria">
        <div class='fas fa-clipboard' style='font-size:48px'></div>
        <h2>Categorias</h2>
        <ul class="b">
            <li><a href="cadastroCategoria.jsp">Cadastro</a></li>     
            <li><a href="consultaCategoria.jsp">Consulta</a></li>
        </ul>
        </div>

        <div class="usuario">
        <div class='fas fa-user' style='font-size:48px'></div>
        <h2>Usuário</h2>
        <ul class="b">   
            <li><a href="consultaUsuario.jsp">Consulta Meus Dados</a></li>
        </ul>
        </div>
        
        <div class="resumo">
        <div class='fas fa-balance-scale' style='font-size:48px'></div>
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
