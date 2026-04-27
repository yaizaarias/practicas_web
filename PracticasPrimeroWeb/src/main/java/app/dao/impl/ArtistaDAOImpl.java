package app.dao.impl;

import app.Artista;
import app.Cancion;
import app.dao.ArtistaDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistaDAOImpl implements ArtistaDAO {

    private Connection conn;

    public ArtistaDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Artista> findAll() {
        List<Artista> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM artistas";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Artista a = new Artista(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("edad"),
                        rs.getString("pais"),
                        rs.getString("productor"),
                        rs.getInt("oyentesMensuales"),
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
    public Artista findByNombre(String nombre) {
        Artista a = null;

        try {
            String sql = "SELECT * FROM artistas WHERE LOWER(nombre) = LOWER(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nombre);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Artista(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getInt("edad"),
                    rs.getString("pais"),
                    rs.getString("productor"),
                    rs.getInt("oyentesMensuales"),
                    rs.getString("biografia"),
                    rs.getString("genero")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return a;
    }

    @Override
    public Artista findById(int id) {
        Artista a = null;

        try {
            String sql = "SELECT * FROM artistas WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Artista(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("edad"),
                        rs.getString("pais"),
                        rs.getString("productor"),
                        rs.getInt("oyentesMensuales"),
                        rs.getString("biografia"),
                        rs.getString("genero")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return a;
    }

    @Override
    public void insert(Artista a) {
        try {
            String sql = "INSERT INTO artistas(nombre, edad, pais, productor, oyentesMensuales, biografia, genero) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, a.getNombre());
            ps.setInt(2, a.getEdad());
            ps.setString(3, a.getPais());
            ps.setString(4, a.getProductor());
            ps.setInt(5, a.getOyentesMensuales());
            ps.setString(6, a.getBiografia());
            ps.setString(7, a.getGenero());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Artista a) {
        try {
            String sql = "UPDATE artistas SET nombre=?, edad=?, pais=?, productor=?, oyentesMensuales=?, biografia=?, genero=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, a.getNombre());
            ps.setInt(2, a.getEdad());
            ps.setString(3, a.getPais());
            ps.setString(4, a.getProductor());
            ps.setInt(5, a.getOyentesMensuales());
            ps.setString(6, a.getBiografia());
            ps.setString(7, a.getGenero());
            ps.setInt(8, a.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM artistas WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Relación de artistas y canciones 
    public List<Cancion> findCancionesByArtista(int idArtista) {
        List<Cancion> lista = new ArrayList<>();

        try {
            String sql = """
                SELECT c.*
                FROM canciones c

                INNER JOIN artista_cancion ac ON c.id = ac.id_cancion
                
                WHERE ac.id_artista = ?
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idArtista);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Cancion c = new Cancion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("duracion"),
                        rs.getLong("reproducciones"),
                        rs.getDate("fecha"),
                        rs.getInt("idAlbum")
                );
                lista.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

	@Override
	public List<Artista> findByGenero(String genero) {
		return null;
	}

	@Override
	public List<Artista> findByPais(String pais) {
		return null;
	}

	@Override
	public List<Artista> findTopByOyentes(int limit) {
		return null;
	}

	@Override
	public int countCanciones(int idArtista) {
		return 0;
	}
}