package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Albumes;
import app.Cancion;
import app.dao.AlbumDAO;
import app.dao.CancionDAO;
import app.dao.impl.AlbumDAOImpl;
import app.dao.impl.CancionDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuscarAlbumServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreAlbum = request.getParameter("album");

        try {

            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            DataSource ds = (DataSource) envContext.lookup("jdbc/musicaDB");

            Connection conn = ds.getConnection();

            AlbumDAO albumDAO = new AlbumDAOImpl(conn);
            CancionDAO cancionDAO = new CancionDAOImpl(conn);

            
            Albumes album = albumDAO.findByNombre(nombreAlbum);

            if (album != null) {

               
                List<Cancion> canciones = cancionDAO.findByAlbum(album.getId());

                request.setAttribute("canciones", canciones);

            } else {

                request.setAttribute("error", "No existe ese álbum");

            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("albumes.jsp").forward(request, response);
    }
}