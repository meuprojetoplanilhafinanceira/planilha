<%-- 
    Document   : consultalocacao
    Created on : 13 de nov de 2020, 08:17:15
    Author     : entra21
--%>

<%@page import="utils.ConversorData"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Modelos.Despesa"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>

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
    <body>
          <%
            int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>   

        <form action="consultaBalancete.jsp" method="POST">
            <div class="container3">
                <label>Digite a Data Inicial</label>
                <input style="width: 200px" type="date" name="dataInicio" />
                <br>

                <label>Digite a Data Final</label>
                <input style="width: 200px" type="date" name="dataFim" />
                <br>
                <br>
                <input class="salvar" type="button" value="Consultar" onclick="enviaForm()" />
                <br/>
                <br>
                <div>
                    <%
                        String inicio = request.getParameter("dataInicio");
                        String fim = request.getParameter("dataFim");
                        float valorReceita = 0;
                        float valorDespesa = 0;
                        if (inicio != null & fim != null) {
                            Date dataInicio = Date.valueOf(inicio);
                            Date dataFim = Date.valueOf(fim);
                           
                            Receita receita = new Receita();
                            valorReceita = receita.getTotalReceita(idUser, dataInicio, dataFim);
                            Despesa despesa = new Despesa();
                            valorDespesa = despesa.getTotalDespesa(idUser, dataInicio, dataFim);
                        }
                    %>
                    <p class="ret12">Total das Rendas:<br> <span> <%out.write(ConversorData.formataMoeda(valorReceita));%> </span></p>
                    <p class="ret13">Total de Gastos:<br> <span><%out.write(ConversorData.formataMoeda(valorDespesa));%></span> </p>
                    <p class="ret14"> Saldo: <span id="saldo"> <%out.write(ConversorData.formataMoeda(valorReceita - valorDespesa));%></span></p>                
                </div>    

            </div>

        </form>      

        <script>
            function enviaForm() {
                var inicio = document.getElementsByName("dataInicio")[0].value;
                var fim = document.getElementsByName("dataFim")[0].value;
                if (inicio === "" || fim === "") {
                    alert("è preciso informar datas");
                } else
                    document.forms[0].submit();
            }
            
            var saldo = document.getElementById("saldo");
            var valor = parseFloat(saldo.innerHTML);
            if (valor < 0){
                saldo.style="color:red";
            }else{
                saldo.style="color:blue";
            }
            
        </script>
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>
    </body>
</html>