package app;

public class Artista {
	private int id;
	private String nombre;
	private int edad;
	private String pais;
	private String productor;
	private int oyentesMensuales;
	private String biografia;
	private String genero;

	public Artista(int id, String nombre, int edad, String pais, String productor, int oyentesMensuales,
			String biografia, String genero) {
		this.id = id;
		this.nombre = nombre;
		this.edad = edad;
		this.pais = pais;
		this.productor = productor;
		this.oyentesMensuales = oyentesMensuales;
		this.biografia = biografia;
		this.genero = genero;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getProductor() {
		return productor;
	}

	public void setProductor(String productor) {
		this.productor = productor;
	}

	public int getOyentesMensuales() {
		return oyentesMensuales;
	}

	public void setOyentesMensuales(int oyentesMensuales) {
		this.oyentesMensuales = oyentesMensuales;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}
}