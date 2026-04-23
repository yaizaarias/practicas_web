package app.dao.impl;

import app.Usuario;
import app.dao.UsuarioDAO;

import java.sql.*;

public class UsuarioDAOImpl implements UsuarioDAO {

    private Connection conn;

    public UsuarioDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Usuario login(String email, String password) {
        Usuario u = null;

        try {
            String sql = "SELECT * FROM usuario WHERE email=? AND contrasena=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("contrasena"),
                        rs.getString("rol"),
                        rs.getString("nickname")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    @Override
    public Usuario findByEmail(String email) {
        return null; 
    }

    @Override
    public void register(Usuario u) {
        try {
            String sql = "INSERT INTO usuario(email, contrasena, rol) VALUES (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, u.getEmail());
            ps.setString(2, u.getContrasena());
            ps.setString(3, u.getRol());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}