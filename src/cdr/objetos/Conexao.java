package cdr.objetos;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	private Connection conexao;
	
	// Abri Conexão
	public Conexao() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://localhost/cdr";
			conexao = DriverManager.getConnection(url, "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Fecha Conexão
	public void desconecta() {
		try {
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Obtem a Conexão
	public Connection getConexao() {
		return this.conexao;
	}
}
