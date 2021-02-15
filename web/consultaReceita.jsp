<%-- 
    Document   : consultaReceita
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
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
        
        <%
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <div class="container1"><h1>Consulta Receitas</h1>
                <hr />
                <%
                    Receita receita = new Receita();
                    ResultSet rs = receita.consultarInner(idUser);
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
                            <td><%out.write("<a href=editarReceita.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Editar</a>");%></td>   
                            <td><%out.write("<a href=excluirReceita.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Excluir</a>");%></td>   
                        </tr>
                        <%}%>
                    </tbody>
                </table>
        </div>      
        <footer>
         <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>   
        </footer>   
    </body>
</html>
