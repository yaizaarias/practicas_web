package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Artista;
import app.Cancion;
import app.dao.ArtistaDAO;
import app.dao.impl.ArtistaDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuscarArtistaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        Connection conn = null;

        try {
            if (query == null || query.trim().isEmpty()) {
                request.setAttribute("errorBusqueda", "Escribe el nombre de un artista para iniciar una búsqueda");
                request.getRequestDispatcher("/artistas.jsp").forward(request, response);
                return;
            }

            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            conn = ds.getConnection();

            ArtistaDAOImpl artistaDAO = new ArtistaDAOImpl(conn);

            Artista artista = artistaDAO.findByNombre(query.trim());

            if (artista != null) {
                List<Cancion> canciones = artistaDAO.findCancionesByArtista(artista.getId());

                request.setAttribute("artista", artista);
                request.setAttribute("canciones", canciones);
                request.getRequestDispatcher("/infoArtista.jsp").forward(request, response);
            } else {
                request.setAttribute("errorBusqueda", "No se ha encontrado ningún artista");
                request.getRequestDispatcher("/artistas.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorBusqueda", "Error interno en la búsqueda");
            request.getRequestDispatcher("/artistas.jsp").forward(request, response);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}