package app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import app.Artista;
import app.Cancion;
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
        String origen = request.getParameter("origen");
        String artistaActualIdStr = request.getParameter("artistaActualId");
        Connection conn = null;

        try {

            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
            conn = ds.getConnection();

            ArtistaDAOImpl artistaDAO = new ArtistaDAOImpl(conn);
            
            if (query == null || query.trim().isEmpty()) {
            	volverConError(request, response, artistaDAO, origen, artistaActualIdStr,
                        "Escribe el nombre de un artista");
                return;
            }

            Artista artistaBuscado = artistaDAO.findByNombre(query.trim());

            if (artistaBuscado != null) {
                List<Cancion> canciones = artistaDAO.findCancionesByArtista(artistaBuscado.getId());

                request.setAttribute("artista", artistaBuscado);
                request.setAttribute("canciones", canciones);
                request.getRequestDispatcher("/infoArtista.jsp").forward(request, response);
            } else {
            	volverConError(request, response, artistaDAO, origen, artistaActualIdStr,
                        "No se ha encontrado ningún artista con ese nombre");
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
    
    private void volverConError(HttpServletRequest request, HttpServletResponse response,
            ArtistaDAOImpl artistaDAO, String origen, String artistaActualIdStr,
            String mensaje) throws ServletException, IOException {

    	request.setAttribute("errorBusqueda", mensaje);

    	if ("infoArtista".equals(origen) && artistaActualIdStr != null && !artistaActualIdStr.isEmpty()) {
    		try {
    			int artistaActualId = Integer.parseInt(artistaActualIdStr);

    			Artista artistaActual = artistaDAO.findById(artistaActualId);
    			List<Cancion> cancionesActuales = artistaDAO.findCancionesByArtista(artistaActualId);

    			request.setAttribute("artista", artistaActual);
    			request.setAttribute("canciones", cancionesActuales);
    			request.getRequestDispatcher("/infoArtista.jsp").forward(request, response);
    			return;

    		} catch (NumberFormatException e) {
    			e.printStackTrace();
    		}
    	}

    	if ("index".equals(origen)) {
    		request.getRequestDispatcher("/index.jsp").forward(request, response);
    	} else {
    		request.getRequestDispatcher("/artistas.jsp").forward(request, response);
    	}
    }
   }