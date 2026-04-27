<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, app.Artista, app.Albumes, app.Cancion" %>

<h1>Resultados de búsqueda: <%= request.getAttribute("query") %></h1>

<h2>Artistas</h2>
<%
List<Artista> artistas = (List<Artista>) request.getAttribute("artistas");
for (Artista a : artistas) {
%>
    <p><%= a.getNombre() %></p>
<% } %>

<h2>Álbumes</h2>
<%
List<Albumes> albumes = (List<Albumes>) request.getAttribute("albumes");
for (Albumes a : albumes) {
%>
    <p><%= a.getTitulo() %></p>
<% } %>

<h2>Canciones</h2>
<%
List<Cancion> canciones = (List<Cancion>) request.getAttribute("canciones");
for (Cancion c : canciones) {
%>
    <p><%= c.getTitulo() %></p>
<% } %>