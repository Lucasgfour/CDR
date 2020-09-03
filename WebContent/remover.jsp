<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="cdr.objetos.LancamentoDao"%>
<%@page import="cdr.objetos.Lancamento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Remover ...</title>
	<link rel="icon" href="favicon.ico" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
	<body>
		<%
			try {
				Lancamento lanc = new Lancamento();
				LancamentoDao lancDao = new LancamentoDao();
				DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				int codigo = Integer.parseInt(request.getParameter("id"));
				lancDao.excluir(codigo);	
				response.sendRedirect("index.jsp#" + lanc.getCodigo());
			} catch (Exception e) {
				out.print("<h1>ERRO AO REMOVER</h1>\n<p>" + e.getMessage() + "</p>");
			}
		%>
	</body>
</html>