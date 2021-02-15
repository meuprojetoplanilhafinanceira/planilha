<%-- 
    Document   : consultaDespesa
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
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
        </h3>
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
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
       
        <div class="container1"><h1>Consulta Despesas</h1>
              
                <%
                    Despesa despesa = new Despesa();
                    ResultSet rs = despesa.consultarInner(idUser);
                %>
                <table>
                    <thead>
                    <th>Id</th>
                    <th>Data</th>
                    <th>Categoria</th>
                    <th>Valor</th>
                    <th>Descrição</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                    </thead> 
                    <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><%out.write(""+rs.getString("id"));%></td>
                            <td><%out.write(rs.getString("data"));%></td>
                            <td><%out.write(rs.getString("categoria"));%></td>
                            <td><%out.write(ConversorData.formataMoeda(rs.getFloat("valor")));%></td>
                            <td><%out.write(rs.getString("descricao"));%></td>
                            <td><%out.write("<a href=editarDespesa.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Editar</a>");%></td>   
                            <td><%out.write("<a href=excluirDespesa.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Excluir</a>");%></td>   
                        </tr>
                        <%}%>
                    </tbody>
                </table>
        </div>
                   
        
   <div class="final">
    <i><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
</div>               
          
    </body>
    
</html>
