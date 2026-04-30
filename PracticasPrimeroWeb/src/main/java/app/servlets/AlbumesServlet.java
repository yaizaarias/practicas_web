package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Cancion;
import app.dao.impl.CancionDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AlbumesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;

        try {

            Context initCtx = new InitialContext();

            Context envCtx =
                    (Context) initCtx.lookup("java:comp/env");

            DataSource ds =
                    (DataSource) envCtx.lookup("jdbc/musicaDB");

            conn = ds.getConnection();

            CancionDAOImpl cancionDAO =
                    new CancionDAOImpl(conn);
            
            
            List<Cancion> randoms = cancionDAO.findRandom(6);

            request.setAttribute("randoms", randoms);

            request.getRequestDispatcher("/albumes.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.getRequestDispatcher("/albumes.jsp")
                    .forward(request, response);

        } finally {

            try {

                if (conn != null)
                    conn.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}