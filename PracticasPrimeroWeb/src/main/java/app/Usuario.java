package app;

public class Usuario {
	private int id;
	private String email;
	private String contrasena;
	private String rol;
	private String nickname;

	public Usuario() {
	}

	public Usuario(int id, String email, String contrasena, String rol, String nickname) {
		this.id = id;
		this.email = email;
		this.contrasena = contrasena;
		this.rol = rol;
		this.nickname = nickname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
