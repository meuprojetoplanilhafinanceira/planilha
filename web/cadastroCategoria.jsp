<%-- 
    Document   : cadastroCategoria
    Created on : 29 de out de 2020, 10:44:15
    Author     : entra21
--%>

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
                        int idUser = 0;
                        String usuario = (String) session.getAttribute("usuario");
                        if (usuario == null) {
                            response.sendRedirect("login.jsp");
                        } else {
                            idUser = (int) session.getAttribute("idUser");
                        }

                        String msg = "";
                        if (request.getParameter("msg") != null) {
                            msg = request.getParameter("msg");
                        }
                    %>
                <div class="cadcat"><h1> Cadastro da Nova Categoria </h1>
                        <form action="recebeDadosCategoria.jsp" method="POST">
                            <label>Informe a descrição</label>
                            <input type ="text" name="descricao" /> 
                            <br>
                            <br>
                            <label>Informe o tipo</label>
                            <select  style="width: 15%" name="tipo">
                                <option value="R">Receita</option>
                                <option value="D">Despesa</option>
                            </select>
                            <br>
                            <br>     
                            <label><%out.write(msg);%></label> 
                     
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
                     
                    <footer>
                        <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
                    </footer>
                    </body>
                    </html>
