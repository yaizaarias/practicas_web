package app;

public class Cancion {
	private int id;
	private String titulo;
	private String duracion;
	private long reproducciones;
	private java.sql.Date fecha;
	private int idAlbum;

	public Cancion(int id, String titulo, String duracion, long reproducciones, java.sql.Date fecha, int idAlbum) {
		this.id = id;
		this.titulo = titulo;
		this.duracion = duracion;
		this.reproducciones = reproducciones;
		this.fecha = fecha;
		this.idAlbum = idAlbum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDuracion() {
		return duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public long getReproducciones() {
		return reproducciones;
	}

	public void setReproducciones(long reproducciones) {
		this.reproducciones = reproducciones;
	}

	public java.sql.Date getFecha() {
		return fecha;
	}

	public void setFecha(java.sql.Date fecha) {
		this.fecha = fecha;
	}

	public int getIdAlbum() {
		return idAlbum;
	}

	public void setIdAlbum(int idAlbum) {
		this.idAlbum = idAlbum;
	}
}
