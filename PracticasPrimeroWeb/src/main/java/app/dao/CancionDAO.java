package app.dao;

import java.util.List;
import app.Cancion;

public interface CancionDAO {

    List<Cancion> findAll();

    Cancion findById(int id);

    List<Cancion> findByAlbum(int idAlbum);

    List<Cancion> findTopByReproducciones(int limit);

    void insert(Cancion c);

    void update(Cancion c);

    void delete(int id);
}