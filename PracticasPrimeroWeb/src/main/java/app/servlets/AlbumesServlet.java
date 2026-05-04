package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Cancion;
import app.dao.CancionDAO;
import app.dao.impl.CancionDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlbumesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");

            DataSource ds = (DataSource) envContext.lookup("jdbc/musicaDB");

            Connection conn = ds.getConnection();

            CancionDAO cancionDAO = new CancionDAOImpl(conn);

            List<Cancion> randoms = cancionDAO.findRandom(6);

            request.setAttribute("randoms", randoms);

            request.getRequestDispatcher("albumes.jsp")
                   .forward(request, response);

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("albumes.jsp").forward(request, response);
    }
}