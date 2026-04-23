package app.dao;

import java.util.List;
import app.Albumes;

public interface AlbumDAO {

    List<Albumes> findAll();

    Albumes findById(int id);

    List<Albumes> findByArtista(int idArtista);

    List<Albumes> findLatest();

    void insert(Albumes a);

    void update(Albumes a);

    void delete(int id);
}