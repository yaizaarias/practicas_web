package app.dao;

import app.Usuario;

public interface UsuarioDAO {

    Usuario login(String identificador, String password);

    Usuario findByEmail(String email);

    void register(Usuario u);
}