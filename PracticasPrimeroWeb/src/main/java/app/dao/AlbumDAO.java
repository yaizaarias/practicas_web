package app.dao;

import java.util.List;
import app.Albumes;

public interface AlbumDAO {

    List<Albumes> findAll();

    Albumes findById(int id);

    List<Albumes> findLatest();

    List<Albumes> findByNombre(String nombre);

    void insert(Albumes a);

    void update(Albumes a);

    void delete(int id);

	List<Albumes> findByTitulo(String titulo);
	
	List<Albumes> search(String query);
	
	
}