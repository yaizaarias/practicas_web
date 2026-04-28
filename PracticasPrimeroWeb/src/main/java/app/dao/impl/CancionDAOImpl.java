package app.dao.impl;


import app.Artista;
import app.Cancion;
import app.dao.CancionDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CancionDAOImpl implements CancionDAO {

    private Connection conn;

    public CancionDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Cancion> findAll() {
        List<Cancion> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM cancion";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Cancion c = new Cancion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("duracion"),
                        rs.getLong("reproducciones"),
                        rs.getDate("fecha"),
                        rs.getInt("id_album"),
                        rs.getString("url")
                );
                lista.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Cancion findById(int id) {
        Cancion c = null;

        try {
            String sql = "SELECT * FROM cancion WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	c = new Cancion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("duracion"),
                        rs.getLong("reproducciones"),
                        rs.getDate("fecha"),
                        rs.getInt("id_album"),
                        rs.getString("url")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return c;
    }

    @Override
    public void insert(Cancion c) {
        try {
            String sql = "INSERT INTO cancion(titulo,duracion,reproducciones,fecha,id_album) VALUES (?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, c.getTitulo());
            ps.setString(2, c.getDuracion());
            ps.setLong(3, c.getReproducciones());
            ps.setDate(4, c.getFecha());
            ps.setInt(5, c.getIdAlbum());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Cancion c) {
        try {
            String sql = "UPDATE cancion SET titulo=?, duracion=?, reproducciones=?, fecha=?, id_album=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, c.getTitulo());
            ps.setString(2, c.getDuracion());
            ps.setLong(3, c.getReproducciones());
            ps.setDate(4, c.getFecha());
            ps.setInt(5, c.getIdAlbum());
            ps.setInt(6, c.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM cancion WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Artista> findArtistasByCancion(int idCancion) {
        List<Artista> lista = new ArrayList<>();

        try {
            String sql = """
                SELECT a.*
                FROM artista a
                INNER JOIN artista_cancion ac ON a.id = ac.id_artista
                WHERE ac.id_cancion = ?
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idCancion);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Artista a = new Artista(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("edad"),
                        rs.getString("pais"),
                        rs.getString("productor"),
                        rs.getInt("oyentes_mensuales"),
                        rs.getString("biografia"),
                        rs.getString("genero")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    
    @Override
    public List<Cancion> findByAlbum(int idAlbum) {
        List<Cancion> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM canciones WHERE id_album = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idAlbum);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(new Cancion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("duracion"),
                        rs.getLong("reproducciones"),
                        rs.getDate("fecha"),
                        rs.getInt("id_album")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }


	@Override
	public List<Cancion> findTopByReproducciones(int limit) {

		return null;
	}
}

