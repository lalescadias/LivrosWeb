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
<title>Listagem livro</title>
</head>
<body>
<%@include file ="menu.jsp" %>
	<h1>Listagem livro</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº livro</th>
			<th>Data</th>
			<th>Titulo</th>
			<th>Ano publicação</th>
			<th>Preco</th>
			<th>Tema</th>
			<th>Escritor</th>
		</tr>		 
		<%
		String sql = "select livros.id_livro, livros.data_aquisicao,livros.titulo,livros.ano_publicacao,livros.preco, temas.tema as ref, escritores.nome as ref2"+
					 " from livros,temas,escritores"+
					 " where livros.cod_tema = temas.cod_tema and livros.cod_escritor = escritores.cod_escritor;";
		String wid,wdata,wtitulo,wano,wpreco,wtema,wescritor;
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			wid = rs.getString("id_livro");
			wdata = rs.getString("data_aquisicao");
			wtitulo =rs.getString("titulo");
			wano =rs.getString("ano_publicacao");
			wpreco = rs.getString("preco");
			wtema = rs.getString("ref");
			wescritor = rs.getString("ref2");
			out.println("<tr><td>" + wid + "</td>");
			out.println("<td>" + wdata + "</td>");
			out.println("<td>" + wtitulo + "</td>");
			out.println("<td>" + wano + "</td>");
			out.println("<td>" + wpreco + "</td>");
			out.println("<td>" + wtema + "</td>");
			out.println("<td>" + wescritor + "</td></tr>");		
		}
		%>
	</table>
</body>
</html>