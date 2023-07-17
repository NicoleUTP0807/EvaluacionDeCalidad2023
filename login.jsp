<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iniciar Sesi�n | SoloCiencia.com</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
    <% // Crear las variables para la entrada del formulario (con id o name)
        String nombre = request.getParameter("fname");
        String contrase�a = request.getParameter("pass");	        
    %>
    
    <%@page import="java.sql.*" %>
    
    <%
	    String url = "jdbc:mysql://localhost:3306/solo_ciencia";
	    String username = "root";
	    String password = "";
	    Boolean result;
	    
	    // Cadena, con las posiciones de los par�metros
	    String sqlquery = "SELECT * FROM registro WHERE Nombre=? AND Contrase�a=?";

    	try {
	    	// Driver para conectarse a la base de Datos
	    	Class.forName("com.mysql.jdbc.Driver");
	    	
	    	// Declarar la conexion a la base de datos
	    	Connection dbconnect = DriverManager.getConnection(url, username, password);
	    	    	
	    	// Consulta Predefinida
	    	PreparedStatement consultaForm = dbconnect.prepareStatement(sqlquery);
	    	
	    	// Establecer los valores de los par�metros
	    	consultaForm.setString(1, nombre);
	    	consultaForm.setString(2, contrase�a);
	    	
	    	// Verificar los datos para el inicio de sesi�n
	    	ResultSet resultado = consultaForm.executeQuery();
	    	
	    	if (resultado.next()) {
	    	    System.out.println("El usuario existe.");
	    	    response.sendRedirect("home.html");
	    	} else {
	    	    System.out.println("Este usuario no existe. Verifique los datos que ha introducido");
	    	    response.sendRedirect("index.html?login=incorrecto");
	    	}
    	
    	} catch (Exception e)
    	{
    		out.println("--ERROR--");
    		out.println("--Consulta Inv�lida--");  	
    	}
    	
    %>

</body>
</html>

