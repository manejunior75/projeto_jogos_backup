package Conexao;

import java.sql.*;

public class Conecta {

	public static Connection getConnection() throws SQLException {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/projeto", "root", "root");

		} catch (ClassNotFoundException e) {
			throw new SQLException(e.getException());
		}
	}
}