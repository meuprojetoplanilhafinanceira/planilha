<%-- 
    Document   : cadastroDespesa
    Created on : 13/12/2020, 20:01:48
    Author     : User
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
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
        <div class="cadcat1"><h1>Editar seu Gasto</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            Despesa despesa = new Despesa();
            Categoria categoria = new Categoria();
            List<Categoria> categorias = null;
            if (id != 0 && idUser != 0) {
                despesa = despesa.consultar(id, idUser);
                categorias = categoria.consultar(idUser, "D");  //consulta as categorias tipo=DESPESA
            }
        %>
        <div>
            <form action="recebeEditaDespesa.jsp" method="POST">

                <input type="hidden" name="id" value="<%out.write(""+despesa.getId());%>">
                <label>Informe a Categoria</label>
                <select name="idCategoria"><% for (Categoria c : categorias) { %>
                    <option value="<%out.write("" + c.getId());%>"><%out.write(c.getDescricao());%></option>
                    <%}%>
                </select> 
                <br>
                <br>
                <label>Informe a Descrição</label>
                <input type="text" name="descricao" value="<%out.write(despesa.getDescricao());%>"/> 
                <br>
                <br>
                <label>Informe o Valor</label>
                <input type="text" name="valor" value="<%out.write(String.valueOf(despesa.getValor()));%>"/>
                <br>
                <br>
                <label>Informe a Data</label>
                <input type="date" name="data" value="<%out.write(String.valueOf(despesa.getData()));%>"/>
                <br>
                <br>
                <input class="cancelar" type="button" value="Alterar" onclick="enviaForm()" />
            </form>
    </div>
    <script>
        function enviaForm() {
            /*var descricao = document.getElementsByName("descricao");
             if (descricao[0].value === "") {
             descricao[0].focus();
             alert("informe a descricao");
             exit();
             }*/
            var valor = document.getElementsByName("valor");
            if (valor[0].value === "") {
                valor[0].focus();
                alert("informe o valor");
                exit();
            }
            var data = document.getElementsByName("data");
            if (data[0].value === "") {
                data[0].focus();
                alert("informe a data");
                exit();
            }

            document.forms[0].submit();
        }
    </script>
        </div>   
     <footer>
             <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
    </footer>
</body>
</html>
