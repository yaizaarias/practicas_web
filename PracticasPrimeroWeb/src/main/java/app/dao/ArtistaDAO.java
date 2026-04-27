package app.dao;

import java.util.List;
import app.Artista;
import app.Cancion;

public interface ArtistaDAO {

    List<Artista> findAll();
    
    Artista findByNombre(String nombre);

    Artista findById(int id);

    List<Artista> findByGenero(String genero);

    List<Artista> findByPais(String pais);

    List<Artista> findTopByOyentes(int limit);

    int countCanciones(int idArtista);

    void insert(Artista a);

    void update(Artista a);

    void delete(int id);
    
    public List<Cancion> findCancionesByArtista(int idArtista);
}