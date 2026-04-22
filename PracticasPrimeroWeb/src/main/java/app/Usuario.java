package app;

public class Usuario {
	private String id;
	private String nickname;
	private String email;
	private String contrasena;
	private String rol;
	
	private static int contadorUsuarios=0;

	public Usuario(String nickname, String email, String contrasena, String rol) {
		this.id = "U-"+ contadorUsuarios;
		this.nickname = nickname;
		this.email = email;
		this.setContrasena(contrasena);
		this.rol = rol;
		
		contadorUsuarios++;
	}
	
	public static void setContadorUsuarios(int ultimoRegistro) {
		contadorUsuarios=ultimoRegistro;
	}
	
	public static int getContadorUsuarios() {
        return contadorUsuarios;
    }

	public String getId() {
		return this.id;
	}
	
	public String getNickname() {
		return this.nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContrasena() {
		return this.contrasena;
	}

	public void setContrasena(String contrasena) {
	    if (contrasena != null && contrasena.length() > 6) {
	        this.contrasena = contrasena;
	    } else {
	        throw new IllegalArgumentException("La contraseña debe tener al menos 7 caracteres.");
	    }
	}

	public String getRol() {
		return this.rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}
}
