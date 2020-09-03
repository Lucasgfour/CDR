<%@page import="cdr.objetos.LancamentoDao"%>
<%@page import="cdr.objetos.Lancamento"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   		<%
			int remover = -1;
			try {
				remover = Integer.parseInt(request.getParameter("remover"));
			} catch (Exception e) { }
		%>
<form action="remover.jsp" method="GET">
	 <div class="modal" tabindex="-1" role="dialog" id="modalRemover">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Confirmação para remover Lançamento</h5>
	          <span aria-hidden="true">&times;</span>
	      </div>
	      <div class="modal-body">
	      		<h2>Tem certeza que deseja remover o registro ?</h2>
				<input type="hidden" name="id" value="<%= remover %>"/>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-danger" href="index.jsp#<%= remover %>">Cancelar</a>
	        <input type="submit" class="btn btn-success" value="Salvar"/>
	      </div>
	    </div>
	  </div>
	</div>
</form>
}
		