package app;

public class Albumes {
    private int id;
    private String titulo;
    private java.sql.Date ano;
    private int idArtista;
    
    public Albumes(int id, String titulo, java.sql.Date ano, int idArtista) {
        this.id = id;
        this.titulo = titulo;
        this.ano = ano;
        this.idArtista = idArtista;
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

    public java.sql.Date getAno() { 
    	return ano; 
    	}
    public void setAno(java.sql.Date ano) { 
    	this.ano = ano; 
    	}

    public int getIdArtista() { 
    	return idArtista; 
    	}
    public void setIdArtista(int idArtista) { 
    	this.idArtista = idArtista; 
    	}
}

