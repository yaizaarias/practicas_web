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

            String sql = "SELECT * FROM albumes";

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("id_artista")
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

        Albumes album = null;

        try {

            String sql = "SELECT * FROM albumes WHERE id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                album = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("id_artista")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return album;
    }

    @Override
    public void insert(Albumes a) {

        try {

            String sql =
                    "INSERT INTO albumes(titulo, ano, id_artista) VALUES (?, ?, ?)";

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

            String sql =
                    "UPDATE albumes SET titulo=?, ano=?, id_artista=? WHERE id=?";

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

            String sql = "DELETE FROM albumes WHERE id=?";

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

            String sql =
                    "SELECT * FROM albumes WHERE LOWER(titulo) LIKE LOWER(?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + titulo + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("id_artista")
                );

                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public List<Albumes> search(String query) {

        List<Albumes> lista = new ArrayList<>();

        try {

            String sql =
                    "SELECT * FROM albumes WHERE LOWER(titulo) LIKE LOWER(?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + query + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Albumes a = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("id_artista")
                );

                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    @Override
    public Albumes findByNombre(String nombre) {

        Albumes album = null;

        try {

            String sql =
                    "SELECT * FROM albumes WHERE LOWER(TRIM(titulo)) = LOWER(?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, nombre.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                album = new Albumes(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getDate("ano"),
                        rs.getInt("id_artista")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return album;
    }
}
