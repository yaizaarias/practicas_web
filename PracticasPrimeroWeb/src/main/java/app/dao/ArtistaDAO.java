package app.dao;

import java.util.List;
import app.Artista;

public interface ArtistaDAO {

    List<Artista> findAll();

    Artista findById(int id);

    List<Artista> findByGenero(String genero);

    List<Artista> findByPais(String pais);

    List<Artista> findTopByOyentes(int limit);

    int countCanciones(int idArtista);

    void insert(Artista a);

    void update(Artista a);

    void delete(int id);
}