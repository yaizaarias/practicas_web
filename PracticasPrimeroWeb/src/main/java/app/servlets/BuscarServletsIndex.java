package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Albumes;
import app.Artista;
import app.Cancion;
import app.dao.impl.AlbumDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuscarServletsIndex extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("q");

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            Connection conn = ds.getConnection();

            // DAOs
            AlbumDAOImpl albumDAO = new AlbumDAOImpl(conn);
            // Aquí irían : 
            // ArtistDAO artistDAO = new ArtistDAOImpl(conn); 
            // CancionDAO cancionDAO = new CancionDAOImpl(conn);

            List<Albumes> albumes = albumDAO.search(query);

            // TEMPORALES (hasta tener DAOs reales)
            List<Artista> artistas = List.of();
            List<Cancion> canciones = List.of();

            request.setAttribute("query", query);
            request.setAttribute("albumes", albumes);
            request.setAttribute("artistas", artistas);
            request.setAttribute("canciones", canciones);

            request.getRequestDispatcher("/resultados.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
