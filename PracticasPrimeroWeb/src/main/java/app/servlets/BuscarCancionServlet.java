package app.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Cancion;
import app.dao.CancionDAO;
import app.dao.impl.CancionDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuscarCancionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        Connection conn = null;

        try {
            if (query == null || query.trim().isEmpty()) {
                request.setAttribute("errorBusqueda", "Escribe el nombre de una canción");
                request.getRequestDispatcher("/canciones.jsp").forward(request, response);
                return;
            }

            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            conn = ds.getConnection();

            CancionDAO cancionDAO = new CancionDAOImpl(conn);
            Cancion cancion = cancionDAO.findByTitulo(query.trim());

            if (cancion != null && cancion.getUrl() != null && !cancion.getUrl().isEmpty()) {
                response.sendRedirect(cancion.getUrl());
            } else {
                request.setAttribute("errorBusqueda", "No se ha encontrado ninguna canción con ese nombre");
                request.getRequestDispatcher("/canciones.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorBusqueda", "Error interno en la búsqueda");
            request.getRequestDispatcher("/canciones.jsp").forward(request, response);
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
