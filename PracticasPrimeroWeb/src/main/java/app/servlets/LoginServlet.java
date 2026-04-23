package app.servlets;

import java.io.IOException;

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

        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        /*Los datos consultados son ficticios, hay que cambiarlos en su momento por la consulta a la base de datos*/
        if (usuario.equals("bea1234") && contrasena.equals("123456")) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            sesion.setAttribute("rol", "admin"); /*cambiar rol al que aparezca en la tabla*/
            sesion.setAttribute("sesionIniciada", "Sesion iniciada en " + usuario);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            
        } else {
            request.setAttribute("error", "ERROR: Usuario o contraseña incorrectos");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
	}
}
