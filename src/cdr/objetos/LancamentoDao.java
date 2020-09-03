package cdr.objetos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

public class LancamentoDao {
	public String erro = "";
	
	// Consultar Lista de Valores
	public LinkedList<Lancamento> listar() {
		Conexao con = new Conexao();
		LinkedList<Lancamento> lista = new LinkedList<Lancamento>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			String sql = "SELECT codigo, data, descricao, tipo, valor FROM lancamento ORDER BY data ASC";
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			erro = String.valueOf(res.getFetchSize());
			while(res.next()) {
				Lancamento p = new Lancamento();
				p.setCodigo(res.getInt("codigo"));
				p.setData(LocalDate.parse(res.getString("data"), formatter));
				p.setDescricao(res.getString("descricao"));
				p.setTipo(res.getBoolean("tipo"));
				p.setValor(res.getDouble("valor"));
				lista.addLast(p);
			}
			res.close();
		} catch (Exception e) {
			erro = e.getMessage();
			e.printStackTrace();
		}
		con.desconecta();
		return lista;
	}
	
	// Consultar Apenas um Valor
	public Lancamento consultar(int codigo) {
		Conexao con = new Conexao();
		Lancamento p = new Lancamento();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		try {
			String sql = "SELECT codigo, data, descricao, tipo, valor FROM lancamento WHERE codigo = " + codigo;
			Statement instrucao = con.getConexao().createStatement();
			ResultSet res = instrucao.executeQuery(sql);
			if(res.next()) {
				p.setCodigo(res.getInt("codigo"));
				p.setData(LocalDate.parse(res.getString("data"), formatter));
				p.setDescricao(res.getString("descricao"));
				p.setTipo(res.getBoolean("tipo"));
				p.setValor(res.getDouble("valor"));
			}
			res.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return p;
	}
	
	// Alterar
	public Boolean alterar(Lancamento a) {
		Conexao con = new Conexao();
		boolean res = false;
		try {
			String sql = "UPDATE lancamento SET data = ?, descricao = ?, tipo = ?, valor = ? WHERE codigo = ?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setDate(1, java.sql.Date.valueOf(a.getData()));
			prep.setString(2, a.getDescricao());
			prep.setBoolean(3, a.isTipo());
			prep.setDouble(4, a.getValor());
			prep.setInt(5, a.getCodigo());
			res = prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	// Inserir
	public Boolean inserir(Lancamento a) {
		Conexao con = new Conexao();
		boolean res = false;
		try {
			String sql = "INSERT INTO lancamento(data, descricao, tipo, valor) VALUES (?, ?, ?, ?)";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setDate(1, java.sql.Date.valueOf(a.getData()));
			prep.setString(2, a.getDescricao());
			prep.setBoolean(3, a.isTipo());
			prep.setDouble(4, a.getValor());
			res = prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	// Excluir
	public Boolean excluir(int codigo) {
		Conexao con = new Conexao();
		boolean res = false;
		try {
			String sql = "DELETE FROM lancamento WHERE codigo = ?";
			PreparedStatement prep = con.getConexao().prepareStatement(sql);
			prep.setInt(1, codigo);
			res = prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public Boolean excluir(Lancamento a) {
		return excluir(a.getCodigo());
	}
}
