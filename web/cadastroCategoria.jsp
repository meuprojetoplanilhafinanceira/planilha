<%-- 
    Document   : cadastroCategoria
    Created on : 29 de out de 2020, 10:44:15
    Author     : entra21
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">   
    </head>
    <body style="background-color: rgba(127,255,212)">
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        <div class="login">
            <img src="imagens/avatar.jpg" style="width:66px">
             <%
                //verifica sessão
                int idUser = 0;
                String nomeUser = "";
                String usuario = (String) session.getAttribute("usuario");

                if (usuario == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    idUser = (int) session.getAttribute("idUser");
                    nomeUser = (String) session.getAttribute("nome");
                }
            %>
            <h3> Olá,
                <%
                    out.write(nomeUser);
                %> !!
            </h3>
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
            <li><a class="link" href="menu.jsp" ><img src="imagens/menu.png" hspace="4">  MENU </a></li>
           <li style="background-color: rgba(211,211,211)"><a class="link" href="cadastroDespesa.jsp"><img src="imagens/gasto.png" hspace="3">  Seu novo Gasto</a> </li>
           <li style="background-color: rgba(173,216,230)"><a class="link" href="cadastroReceita.jsp"><img src="imagens/renda.png" hspace="3">  Sua nova Renda</a></li>
           <li style="background-color: rgba(127,255,212)"><a class="link" href="cadastroCategoria.jsp"><img src="imagens/categoria.png" hspace="3">   Crie nova Categoria</a></li>
           <li style="background-color: rgba(245,222,179)"><a class="link" href="consultaBalancete.jsp"><img src="imagens/resumo.png" hspace="3">  Resumo Financeiro</a></li>
           <li style="background-color: rgba(240,248,255)"><a class="link" href="consultaUsuario.jsp"><img src="imagens/usuario.png" hspace="3">  Meus Dados</a></li>
           <li style="background-color: rgba(255,160,122)"><a class="link" href="consultaCategoriaDefault.jsp"><img src="imagens/configura.png" hspace="3">  Configurações</a></li>
        </ul>
        </div>
        </div>
        </div>
        <%
            String msg = "";
            if (request.getParameter("msg") !=null){
                msg= request.getParameter("msg");
            }
        %>
        
        <div class="cadcat"><h2 style="text-align: center"> Cadastro da Nova Categoria </h2>
            <form action="recebeDadosCategoria.jsp" method="POST"><br>
        <label>Informe a descrição</label>
            <input type ="text" name="descricao" /> 
            <br>
            <br>
        <label>Informe o tipo</label>
            <select  style="width: 18%" name="tipo">
            <option value="R">Receita</option>
            <option value="D">Despesa</option>
            </select>
            <br>
            <br>     
                     
            <input class="salvar" type="button" value="Salvar" onclick="enviaForm()" />
            <input class="cancelar" type="reset" value="Cancelar" onclick="enviaForm()" />
        </form>
                       
        <script>
            function enviaForm() {
                var descricao = document.getElementsByName("descricao");
                if (descricao[0].value === "") {
                descricao[0].focus();
                erros.innerHTML = "Informe a Categoria";
                exit();
                }
                var valor = document.getElementsByName("tipo");
                if (valor[0].value === "") {
                valor[0].focus();
                alert("informe o tipo");
                exit();
                }
                document.forms[0].submit();
                }
                </script>
        </div>
        <div class="final">
        <p> <strong>C</strong> - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech</p>
        </div>
    </body>
    </html>
