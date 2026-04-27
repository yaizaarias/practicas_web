package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Albumes;
import app.dao.impl.AlbumDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class AlbumServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            Connection conn = ds.getConnection();

            AlbumDAOImpl albumDAO = new AlbumDAOImpl(conn);

            List<Albumes> lista;

            if (titulo != null && !titulo.isEmpty()) {
                lista = albumDAO.search(titulo);
            } else {
                lista = albumDAO.findAll();
            }

            request.setAttribute("albumes", lista);

            request.getRequestDispatcher("/albumes.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
