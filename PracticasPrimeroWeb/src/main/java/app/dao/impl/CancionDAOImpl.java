package app.dao.impl;

import app.Cancion;
import app.dao.CancionDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CancionDAOImpl implements CancionDAO {

    private Connection conn;

    public CancionDAOImpl(Connection conn) {
        this.conn = conn;
    }
}
