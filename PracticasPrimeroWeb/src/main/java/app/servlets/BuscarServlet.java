package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import app.Artista;
import app.Albumes;
import app.Cancion;

import app.dao.ArtistaDAO;
import app.dao.AlbumDAO;
import app.dao.CancionDAO;

import app.dao.impl.ArtistaDAOImpl;
import app.dao.impl.AlbumDAOImpl;
import app.dao.impl.CancionDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class BuscarServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");

        Connection conn = null;

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            conn = ds.getConnection();

            ArtistaDAO artistaDAO = new ArtistaDAOImpl(conn);
            AlbumDAO albumDAO = new AlbumDAOImpl(conn);
            CancionDAO cancionDAO = new CancionDAOImpl(conn);

            List<Artista> artistas = artistaDAO.findAll().stream()
                .filter(a -> a.getNombre().toLowerCase().contains(query.toLowerCase()))
                .toList();

            List<Albumes> albumes = albumDAO.findAll().stream()
                .filter(a -> a.getTitulo().toLowerCase().contains(query.toLowerCase()))
                .toList();

            List<Cancion> canciones = cancionDAO.findAll().stream()
                .filter(c -> c.getTitulo().toLowerCase().contains(query.toLowerCase()))
                .toList();


            request.setAttribute("artistas", artistas);
            request.setAttribute("albumes", albumes);
            request.setAttribute("canciones", canciones);
            request.setAttribute("query", query);

            request.getRequestDispatcher("resultados.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error en la búsqueda");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}