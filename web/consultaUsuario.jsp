<%-- 
    Document   : consultaUsuario
    Created on : 18/12/2020, 08:32:04
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Usuario"%>
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
        
        <div class="container1"><h1>Consulta Usuario</h1>
        
        <%
           Usuario u = new Usuario();
           u = u.consultar(idUser);
           
        %>
        <table>
            <thead>
                <th>Id</th>
                <th>Nome</th>
                <th>Cpf</th>
                <th>Data de Nascimento</th>
                <th>Telefone</th>
                <th>Cep</th>
                <th>Endereço</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>E-mail</th>
                <th>Senha</th>
            </thead> 
            <tbody>
                <%if (u != null) {%>
                    <tr>
                    <td><% out.write(""+u.getIdUser());%></td>      
                    <td><% out.write(u.getNome());%></td>
                    <td><% out.write(u.getCpf());%></td>
                    <td><% out.write(String.valueOf(u.getDataNasc()));%></td>
                    <td><% out.write(u.getFone());%></td>
                    <td><% out.write(u.getCep());%></td>
                    <td><% out.write(u.getEndereco());%></td>
                    <td><% out.write(u.getBairro());%></td>
                    <td><% out.write(u.getCidade());%></td>
                    <td><% out.write(u.getUf());%></td>
                    <td><% out.write(u.getEmail());%></td>
                    <td><% out.write(u.getSenha());%></td> 
                    </tr>
                <%}%>
            </tbody>             
        </table>
            <p class="novo"><a href="editarUsuario.jsp">Clique <strong>aqui</strong> para Alterar alguma informação!</a></p>
      
        </div>
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>   
    </body>
</html>
