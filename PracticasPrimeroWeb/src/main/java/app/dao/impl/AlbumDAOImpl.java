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
        return null;
    }

    @Override
    public List<Albumes> findByArtista(int idArtista) {
        return null;
    }

    @Override
    public List<Albumes> findLatest() {
        return null;
    }

    @Override
    public void insert(Albumes a) {}

    @Override
    public void update(Albumes a) {}

    @Override
    public void delete(int id) {}
}