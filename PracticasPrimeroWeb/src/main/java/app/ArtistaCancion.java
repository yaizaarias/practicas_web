package app;

public class ArtistaCancion {

	private String idArtista;
	private String idCancion;

	public ArtistaCancion(Artista artistaBuscado, Cancion cancionBuscada) {
		this.idArtista = artistaBuscado.getId();
		this.idCancion = cancionBuscada.getId();
	}

	public String getIdArtista() {
		return idArtista;
	}

	public String getIdCancion() {
		return idCancion;
	}

}
