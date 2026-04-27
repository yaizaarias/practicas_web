package app;

import app.dao.AlbumDAO;
import app.dao.impl.AlbumDAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class Main {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:mysql://localhost:3306/musica_db";
        String user = "root";
        String password = "70107010";

        Connection conn = DriverManager.getConnection(url, user, password);

        AlbumDAO dao = new AlbumDAOImpl(conn);

        List<Albumes> resultados = dao.search("Coldplay");

        if (resultados.isEmpty()) {
            System.out.println("No se encontraron resultados");
        } else {
            for (Albumes a : resultados) {
                System.out.println(
                        a.getId() + " - " +
                        a.getTitulo() + " - " +
                        a.getAno()
                );
            }
        }

        conn.close();
    }
}
