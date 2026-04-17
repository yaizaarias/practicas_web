package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/musica_db";
		String user = "root";
		String password = "70107010";

		Connection conn = DriverManager.getConnection(url, user, password);
		
		String query = "SELECT * FROM canciones";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			int id = rs.getInt("id");
			String titulo = rs.getString("titulo");
			String duracion = rs.getString("duracion");
			long reproducciones= rs.getLong("reproducciones");
			java.sql.Date fecha = rs.getDate("fecha");
			

			System.out.println(id + " - " + titulo + " - " + duracion + " - " + reproducciones + " - " + fecha);
		}
	}

}
