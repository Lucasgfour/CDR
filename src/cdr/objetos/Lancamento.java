package cdr.objetos;

import java.time.LocalDate;

public class Lancamento {
	private int codigo = 0;
	private LocalDate data = LocalDate.now(); // Data do Lançamento
	private String descricao = ""; // Descrição do Lançamento 
	private boolean tipo = false; // [ True = Receita / False = Despesa ]
	private double valor = 0; // Valor do Lançamento
	
	public int getCodigo() {
		return codigo;
	}
	
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public LocalDate getData() {
		return data;
	}
	
	public void setData(LocalDate data) {
		this.data = data;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public boolean isTipo() {
		return tipo;
	}
	
	public void setTipo(boolean tipo) {
		this.tipo = tipo;
	}
	
	public double getValor() {
		return valor;
	}
	
	// Obter Valor já com seu devido sinal
	public double getValorReal() {
		if(tipo) {
			return getValor();
		} else {
			return (getValor() * -1);
		}
	}
	
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	// Recebe o valor já formato
	public String getTipoToString() {
		if(tipo) {
			return "Receita";
		} else {
			return "Despesa";
		}
	}
	
	
	
	
}
