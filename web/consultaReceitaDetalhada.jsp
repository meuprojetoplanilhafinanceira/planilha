<%-- 
    Document   : consultaReceitaDetalhada
    Created on : 08/02/2021, 10:54:37
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
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
            int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>   
        
        <div class="container4"><h1>Consulta Receita Detalhada</h1>
        
        <form action="consultaReceitaDetalhada.jsp" method="POST">
            
                <label>Digite a Data Inicial</label>
                <input style="width: 50%" type="date" name="dataInicio" />
                <br>

                <label>Digite a Data Final</label>
                <input style="width: 50%" type="date" name="dataFim" />
                <br>

                
                <%
                    Categoria cat = new Categoria();
                    List<Categoria> categorias = cat.consultar(idUser, "R");
                %>

                <input type="checkbox" name="filtrarByCategoria"> Filtrar por categoria?</input>
                <select style="width: 50%" name="categoria">
                    <%for (Categoria ct : categorias) { %>
                    <option value=<%out.write("" + ct.getId());%>><%out.write(ct.getDescricao());%></option>
                    <%}%>
                </select>
                <br>
                
                <label>Agrupar?</label>
                <input type="checkbox" name="agrupar" checked="true" />
                
                <input class="consultar" type="button" value="Consultar"  onclick="enviaForm()"/>
                <br/>
        </form>
        </div>

            <%
                Receita receita = new Receita();
                List<Receita> receitas = new ArrayList<>();
                
                String filtrarByCategoria = request.getParameter("filtrarByCategoria");
                String categoria = request.getParameter("categoria");
               
                String inicio = request.getParameter("dataInicio");
                String fim = request.getParameter("dataFim");
                String agrupar = request.getParameter("agrupar");
                
                if (inicio != null && fim != null) {
                    Date dataInicio = Date.valueOf(inicio);
                    Date dataFim = Date.valueOf(fim);
                    boolean agrupa = false;
                    if (agrupar != null) {
                        agrupa = true;
                    }
                    
                    //busca por categoria
                    if (filtrarByCategoria != null){
                       int idCategoria = Integer.parseInt(categoria);                     
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa, idCategoria);
                    }
                    else
                       receitas = receita.consultaLancamentosByIntervaloData(idUser, dataInicio, dataFim, agrupa);
                }
            %> 


            <%
                if (inicio == null && fim == null) {
                    out.write("<table style='display:none'>");
                } else {
                    if (inicio.isEmpty() && fim.isEmpty()) {
                        out.write("<table style='display:none'>");
                    } else {
                        out.write("<table style='display:block'>");
                    }
                }
            %>
            <table class="container5"> 
            <thead>
            <th>Descricao</th>
            <th>Valor</th>
            <th>Data</th> 
        </thead> 
        <tbody>
            <% for (Receita r : receitas) {%>

            <tr>
                <td><% out.write(r.getDescricao());%></td>
                <td><% out.write(String.valueOf(r.getValor()));%></td>
                <td><% out.write(String.valueOf(r.getData()));%></td>        
            </tr>
            <%}%>
        </tbody>           
    </table>

<script>
                    function enviaForm() {
                        debugger;
                        var dataInicio = document.getElementsByName("dataInicio")[0];
                        if (dataInicio.value === "") {
                            dataInicio.focus();
                            alert("Informe data de Inicio");
                            return;
                        }
                        var dataFim = document.getElementsByName("dataFim")[0];
                        if (dataFim.value === "") {
                            dataFim.focus();
                            alert("Informe data de Final");
                            return;
                        }
                        document.forms[0].submit();
                    }
</script>
<div class="final">
    <i><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
</div>

</body>
</html>
