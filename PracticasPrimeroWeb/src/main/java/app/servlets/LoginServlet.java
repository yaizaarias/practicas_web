package app.servlets;

import java.io.IOException;

import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import app.Usuario;
import app.dao.UsuarioDAO;
import app.dao.impl.UsuarioDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet(/login)//

public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String identificador = request.getParameter("identificador");
        String contrasena = request.getParameter("contrasena");
        
        Connection conn = null;
        
        try {
        	
        	Context initCtx = new InitialContext();
        	Context envCtx = (Context) initCtx.lookup("java:comp/env");
        	DataSource ds = (DataSource) envCtx.lookup("jdbc/musicaDB");
        	conn = ds.getConnection();

            UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl(conn);
            Usuario usuario = usuarioDAO.login(identificador, contrasena);
        	
        	if (usuario != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", usuario.getNickname());
                sesion.setAttribute("email", usuario.getEmail());
                sesion.setAttribute("rol", usuario.getRol()); 
                sesion.setAttribute("sesionIniciada", "Sesion iniciada en " + usuario.getNickname());
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                
            } else {
                request.setAttribute("error", "ERROR: Usuario o contraseña incorrectos");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "ERROR interno al iniciar sesión");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
	}
}
