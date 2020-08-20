<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<style>
	img{
		width: 100px;
		height:100px;
	
	}
	img:hover{
		transform: scale(2);
	}
</style>
<title>Listagem de escritores</title>
</head>
<body>
<%@include file ="menu.jsp" %>
	<h1>Listagem escritor</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº Escritor</th>
			<th>Nome</th>
			<th>Foto</th>
		</tr>		 
		<%
		String sql = "select * from escritores";
		String wid,wnome,wfoto;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("cod_escritor");
			wnome = rs.getString("nome");
			wfoto = rs.getString("foto");
			
			out.println("<tr><td>" + wid + "</td>");		
			out.println("<td>" + wnome + "</td>");
			out.println("<td><img src='Imagem/"+ wfoto + "'"+"></td></tr>");		
		}
		%>
	</table>
</body>
</html>