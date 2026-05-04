package app;

import java.sql.Date;

public class Cancion {

    private int id;
    private String titulo;
    private String duracion;
    private long reproducciones;
    private Date fecha;
    private int idAlbum;
    private String url;

    public Cancion(int id,
            String titulo,
            String duracion,
            long reproducciones,
            Date fecha,
            int idAlbum,
            String url) {

        this.id = id;
        this.titulo = titulo;
        this.duracion = duracion;
        this.reproducciones = reproducciones;
        this.fecha = fecha;
        this.idAlbum = idAlbum;
        this.url = url;
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(int idAlbum) {
        this.idAlbum = idAlbum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
