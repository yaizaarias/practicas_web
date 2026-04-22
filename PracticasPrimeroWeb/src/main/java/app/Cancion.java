package app;

public class Cancion {
	private String id;
	private String titulo;
	private String duracion;
	private long reproducciones;
	private java.sql.Date fecha;
	private String idAlbum;
	
	private static int contadorCanciones=0;

	public Cancion(String titulo, String duracion, long reproducciones, java.sql.Date fecha, Albumes album) {
		this.id = "C-"+ contadorCanciones;
		this.titulo = titulo;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.fecha = fecha;
		this.idAlbum = album.getId();
		
		contadorCanciones++;
	}
	
	public static void setContadorCanciones(int ultimoRegistro) {
		contadorCanciones=ultimoRegistro;
	}
	
	public static int getContadorCanciones() {
        return contadorCanciones;
    }

	public String getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDuracion() {
		return this.duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public long getReproducciones() {
		return this.reproducciones;
	}

	public void setReproducciones(long reproducciones) {
		this.reproducciones = reproducciones;
	}

	public java.sql.Date getFecha() {
		return this.fecha;
	}

	public void setFecha(java.sql.Date fecha) {
		this.fecha = fecha;
	}

	public String getIdAlbum() {
		return this.idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}
}
