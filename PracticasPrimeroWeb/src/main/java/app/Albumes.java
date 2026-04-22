package app;

public class Albumes {
    private String id;
    private String titulo;
    private java.sql.Date ano;
    private String idArtista;
    
    private static int contadorAlbumes=0;
    
    public Albumes(String titulo, java.sql.Date ano, Artista artista) {
    	this.id = "AL-"+ contadorAlbumes;
        this.titulo = titulo;
        this.ano = ano;
        this.idArtista = artista.getId();
        
        contadorAlbumes++;
    }
    
    public static void setContadorAlbumes(int ultimoRegistro) {
		contadorAlbumes=ultimoRegistro;
	}
	
	public static int getContadorAlbumes() {
        return contadorAlbumes;
    }

    public String getId() { 
    	return this.id; 
    	}

    public String getTitulo() { 
    	return titulo; 
    	}
    
    public void setTitulo(String titulo) { 
    	this.titulo = titulo; 
    	}

    public java.sql.Date getAno() { 
    	return ano; 
    	}
    
    public void setAno(java.sql.Date ano) { 
    	this.ano = ano; 
    	}

    public String getIdArtista() { 
    	return idArtista; 
    	}
    
    public void setIdArtista(String idArtista) { 
    	this.idArtista = idArtista; 
    	}
}

