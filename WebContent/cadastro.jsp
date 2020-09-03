<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="icon" href="favicon.ico" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<title>CDR - Novo Lançamento</title>
</head>
	<body class="bg-dark">
		<!-- Corpo da Página -->
		<div class="container-sm bg-light">
			
			<div class="py-5 text-center">
		    	<h1>Cadastro de Novo Lançamento</h1>
		  	</div>
		  	
		  	<!-- Formulário -->
		  	<form action="salvar" method="GET">
			  	<div class="row">
					<div class="col-md-8">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Descrição</span>
							</div>
							<input type="text" class="form-control" placeholder="Descrição" aria-label="Descrição" name="descricao">
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="tipo">Tipo</label>
							</div>
							<select class="custom-select" id="tipo" name="tipo">
								<option selected value="0">Débito</option>
								<option value="1">Crédito</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Data</span>
							</div>
							<input class="form-control" type="date" value="<%= LocalDate.now() %>" id="data" name="data">
						</div>
					</div>
					<div class="col-md-3">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control" name="valor" aria-label="Valor (Reais)">
							<div class="input-group-append">
								<span class="input-group-text">.00</span>
							</div>
						</div>
					</div>
					<div class="col-md-2 text-right">
						<a class="btn btn-danger" href="index.jsp" >Cancelar</a>
					</div>
					<div class="col-md-2 text-right">
						<input type="submit" class="btn btn-success" value="Salvar"/>
					</div>
				</div>
		  	</form>
		</div>
		
		<!-- Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		
	</body>
</html>