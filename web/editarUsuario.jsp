<%-- 
    Document   : editarUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="java.sql.Date"%>
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
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <div class="cadcat3"><h1>Edição do Usuario</h1>
                <%
                    Usuario user = new Usuario();
                    user = user.consultar(idUser);
                %>
                <p id="erros"></p>

                <form action="recebeEditaUsuario.jsp" method="POST">
                    <div>
                    <label>Nome</label>
                    <label id="erroNome" class="error"></label> 
                    <input type="text" name="nome" value="<%out.write(user.getNome());%>"/>
                    <br>
                    <label>Cpf</label>
                    <label id="erroCpf" class="error"></label> 
                    <input type="text" name="cpf" value="<%out.write(user.getCpf());%>"/>
                    <br>
                    <label>Data Nascimento</label>
                    <input type="date" name="dataNascimento" value="<%out.write(String.valueOf(user.getDataNasc()));%>"/> 
                    <br> 
                    <label>Fone</label>
                    <label id="erroFone" class="error"></label>
                    <input type="text" name="fone" value="<%out.write(user.getFone());%>"/>
                    <br>
                    <label>Cep</label>
                    <input type="text" name="cep" value="<%out.write(user.getCep());%>"/> 
                    <br>
                    <label>Endereço</label>
                    <input type="text" name="endereco" value="<%out.write(user.getEndereco());%>"/> 
                    <br>
                    <label>Bairro</label>
                    <input type="text" name="bairro" value="<%out.write(user.getBairro());%>"/>
                    <br>
                    <label>Cidade</label>
                    <input type="text" name="cidade" value="<%out.write(user.getCidade());%>"/>
                    <br>
                    <label>Estado</label>
                    <input type="text" name="uf" value="<%out.write(user.getUf());%>"/> 
                    <br>
                    <label>e-Mail/Usuario</label>
                    <input type="text" name="usuario" value="<%out.write(user.getEmail());%>"/>
                    <br>
                    <label>Senha</label>
                    <input type="password" name="senha" value="<%out.write(user.getSenha());%>"/> 
                    <br>
                   
                    <input class="cancelar" type="button" value="Alterar" onclick="enviarDados()" />
                    </div>
                </form>

                <script>
                    function enviarDados(){
                        var semErros = true;
                        var nome = document.getElementsByName("nome");
                        if (nome[0].value === ""){
                            //erros.innerHTML += "<br>Informe nome";
                            //nome[0].style="border: red solid 3px";
                            //nome[0].focus();
                            document.getElementById("erroNome").innerHTML = " <<< Informe Nome >>>";
                            semErros = false;
                        }
                        var cpf = document.getElementsByName("cpf");
                        if (cpf[0].value === ""){
                            //erros.innerHTML += "<br>Informe cpf";
                            document.getElementById("erroCpf").innerHTML = " <<< Informe Cpf >>>";
                            //cpf[0].focus();
                            semErros = false;
                        }
                        var fone = document.getElementsByName("fone");
                        if (fone[0].value === ""){
                            document.getElementById("erroFone").innerHTML = " <<< Informe Telefone/Celular >>>";
                            semErros = false;
                        }

                        if(semErros){
                            document.forms[0].submit();
                        }
                    }
                </script>
        </div>
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>
    </body>
</html>
