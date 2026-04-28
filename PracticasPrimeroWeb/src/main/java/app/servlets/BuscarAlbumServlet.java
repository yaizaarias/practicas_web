package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

import app.Albumes;
import app.Cancion;
import app.dao.*;
import app.dao.impl.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class BuscarAlbumServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreAlbum = request.getParameter("album");

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            Connection conn = ds.getConnection();

            AlbumDAO albumDAO = new AlbumDAOImpl(conn);
            CancionDAO cancionDAO = new CancionDAOImpl(conn);

            List<Albumes> albumes = albumDAO.findByNombre(nombreAlbum);

            if (albumes == null || albumes.isEmpty()) {
                request.setAttribute("error", "No se ha encontrado el álbum");
                request.getRequestDispatcher("albumes.jsp").forward(request, response);
                return;
            }

            Albumes album = albumes.get(0);

            List<Cancion> canciones = cancionDAO.findByAlbum(album.getId());

            request.setAttribute("album", album);
            request.setAttribute("canciones", canciones);

            request.getRequestDispatcher("albumes.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error interno");
            request.getRequestDispatcher("albumes.jsp").forward(request, response);
        }
    }
}