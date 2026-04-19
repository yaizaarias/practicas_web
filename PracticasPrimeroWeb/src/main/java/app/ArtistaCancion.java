package app;

public class ArtistaCancion {

	private int idArtista;
	private int idCancion;

	public ArtistaCancion(int idArtista, int idCancion) {
		this.idArtista = idArtista;
		this.idCancion = idCancion;
	}

	public int getIdArtista() {
		return idArtista;
	}

	public void setIdArtista(int idArtista) {
		this.idArtista = idArtista;
	}

	public int getIdCancion() {
		return idCancion;
	}

	public void setIdCancion(int idCancion) {
		this.idCancion = idCancion;
	}
}
