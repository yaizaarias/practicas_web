package app.dao.impl;

import app.Albumes;
import app.dao.AlbumDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlbumDAOImpl implements AlbumDAO {

    private Connection conn;

    public AlbumDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Albumes> findAll() {
        List<Albumes> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM album";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Albumes findById(int id) {
        Albumes a = null;

        try {
            String sql = "SELECT * FROM album WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return a;
    }

    @Override
    public List<Albumes> findByArtista(int idArtista) {
        List<Albumes> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM album WHERE idArtista = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idArtista);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public List<Albumes> findLatest() {
        List<Albumes> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM album ORDER BY ano DESC LIMIT 10";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public void insert(Albumes a) {
        try {
            String sql = "INSERT INTO album(titulo, ano, idArtista) VALUES (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, a.getTitulo());
            ps.setDate(2, a.getAno());
            ps.setInt(3, a.getIdArtista());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Albumes a) {
        try {
            String sql = "UPDATE album SET titulo=?, ano=?, idArtista=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, a.getTitulo());
            ps.setDate(2, a.getAno());
            ps.setInt(3, a.getIdArtista());
            ps.setInt(4, a.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            String sql = "DELETE FROM album WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Albumes> findByTitulo(String titulo) {
        List<Albumes> lista = new ArrayList<>();

        try {
            String sql = "SELECT * FROM album WHERE titulo LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + titulo + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // ALBUM + ARTISTA
    public List<Albumes> search(String query) {
        List<Albumes> lista = new ArrayList<>();

        try {
            String sql = """
                SELECT a.*
                FROM album a
                JOIN artista ar ON a.idArtista = ar.id
                WHERE a.titulo LIKE ?
                   OR ar.nombre LIKE ?
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("idArtista")
                );
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}