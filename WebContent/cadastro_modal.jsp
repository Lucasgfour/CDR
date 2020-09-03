<%@page import="cdr.objetos.LancamentoDao"%>
<%@page import="cdr.objetos.Lancamento"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
			int id = -1;
			Lancamento lancamento = new Lancamento();
			LancamentoDao lancDao = new LancamentoDao();
			try {
				id = Integer.parseInt(request.getParameter("id"));
				if(!(id == 0)) {
					lancamento = lancDao.consultar(id);
				}
			} catch (Exception e) { }
		%>
<form action="salvar.jsp" method="GET">
	 <div class="modal" tabindex="-1" role="dialog" id="modalCadastro">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cadastrar / Editar Pessoa</h5>
	          <span aria-hidden="true">&times;</span>
	      </div>
	      <div class="modal-body">
			  	<div class="row">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Descrição</span>
							</div>
							<input type="text" class="form-control" placeholder="Descrição" aria-label="Descrição" name="descricao" value="<%= lancamento.getDescricao() %>">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="tipo">Tipo</label>
							</div>
							<select class="custom-select" id="tipo" name="tipo">
								<% if(lancamento.isTipo()) { %>
											<option value="0">Despesa</option>
											<option selected  value="1">Receita</option>
										<% } else { %>
										<option selected value="0">Despesa</option>
										<option value="1">Receita</option>
									<% } %>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Data</span>
							</div>
							<input class="form-control" type="date" value="<%= lancamento.getData() %>" id="data" name="data">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">R$</span>
							</div>
							<input type="text" class="form-control" name="valor" aria-label="Valor (Reais)" value="<%= lancamento.getValor() %>" >
							<div class="input-group-append">
								<span class="input-group-text">.00</span>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="id" value="<%= lancamento.getCodigo() %>"/>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-danger" href="index.jsp#<%= id %>">Cancelar</a>
	        <input type="submit" class="btn btn-success" value="Salvar"/>
	      </div>
	    </div>
	  </div>
	</div>
</form>
}
		