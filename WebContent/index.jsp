<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="cdr.objetos.LancamentoDao"%>
<%@page import="cdr.objetos.Lancamento"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="favicon.ico" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<title>CDR - Controle Financeiro</title>
</head>
	<body class="bg-dark">
		<!--  Incluir Modal -->
		<%@ include file="cadastro_modal.jsp" %>
		
		<!-- Corpo da Página -->
		<div class="container-lg bg-light">
			<div class="py-5 text-center">
		    	<img class="d-block mx-auto mb-4" src="favicon.ico" alt="" width="72" height="72">
		    	<h2>CDR - Controle financeiro</h2>
		    	<h4><i>Controle de Despesas/Receitas</i></h4>
		  	</div>
		  	<nav class="navbar navbar-dark bg-dark">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="index.jsp?id=0" onclick="$('#modalCadastro').modal('show')">NOVO LANÇAMENTO</a>
					</li>
				</ul>
			</nav>
		  	<div class="row">
		  		<div class="col-md-12">
		  			<table class="table table-striped">
			  			<thead>
			  				<section id="0"></section>
			  				<th>DATA</th>
			  				<th>DESCRIÇÃO</th>
			  				<th>TIPO</th>
			  				<th>VALOR</th>
			  				<th>SALDO</th>
			  				<th></th>
			  			</thead>
			  			<tbody>
			  				<!-- Dados Tabela -->
			  				<%
			  					DecimalFormat df = new DecimalFormat("#,###.00");
			  					double saldo = 0;
			  					for(Lancamento lanc : lancDao.listar()) {
			  				%>
			  					<tr>
			  						<section id="<%= lanc.getCodigo() %>"></section>
				  					<td><%= String.valueOf(lanc.getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))) %></td>
				  					<td><%= lanc.getDescricao() %></td>
				  					<td><%= lanc.getTipoToString() %></td>
				  					<td><%
				  						if(!lanc.isTipo()) {
				  							out.print("<b style=\"color: #bd2130;\">- R$ " + df.format(lanc.getValor()) + "</b>" );
				  							saldo = saldo - lanc.getValor();
				  						} else {
				  							out.print("<b style=\"color: #1e7e34;\">+ R$ " + df.format(lanc.getValor()) + "</b>" );	
				  							saldo = saldo + lanc.getValor();
				  						}
				  					%></td>
				  					<td><%
					  					if(saldo < 0) {
				  							out.print("<b style=\"color: #bd2130;\">R$ " + df.format(saldo) + "</b>" );
				  						} else {
				  							out.print("<b style=\"color: #1e7e34;\">R$ " + df.format(saldo) + "</b>" );		
				  						}
				  					%></td>
				  					<td>
				  						 <button type="button" class="btn btn-secondary dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-offset="10,20"></button>
				  						 <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="index.jsp?id=<%= lanc.getCodigo() %>#<%= lanc.getCodigo() %>">Alterar</a>
											<a class="dropdown-item" href="index.jsp?remover=<%= lanc.getCodigo() %>#<%= lanc.getCodigo() %>">Remover</a>
										</div>
				  				</tr>
			  				<%
			  					}
			  				%>
			  			</tbody>
			  		</table>
		  		</div>
		  	</div>
		  	<div class="py-5 text-center bg-dark">
		    	<h2 style="color: white;">Saldo Final :
		    	<%
		    		if(saldo < 0) {
						out.print("<b style=\"color: #bd2130;\">R$ " + df.format(saldo) + "</b>" );
					} else {
						out.print("<b style=\"color: #1e7e34;\">R$ " + df.format(saldo) + "</b>" );		
					}
		    	%>
		    	</h2>
		  	</div>
		</div>
	
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<% 
			// CASO FOR PARA EDITAR OU CADASTRAR NOVO
			if(id > -1) {
				%>
					<script>
						$('#modalCadastro').modal("show")
					</script>
				<%
			}
		
			// Caso for para REMOVER
			try {
				if(Integer.parseInt(request.getParameter("remover")) > 0) {
					%> <%@ include file="remover_modal.jsp" %> 
						<script>
							$('#modalRemover').modal("show")
						</script>
					<%
				}
			} catch (Exception e) { }
			%>
	</body>
</html>