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
<title>Listagem tema</title>
</head>
<body>
<%@include file ="menu.jsp" %>
	<h1>Listagem de temas</h1>
	<hr>
	<table id="listagem">
		<tr>
			<th>Nº tema</th>
			<th>Nome</th>
		</tr>		 
		<%
				String sql = "select * from temas";
				String wid,wnome;
				Connection cn = LigacaoMysql.criarLigacaoMysql();
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					wid = rs.getString("cod_tema");
					wnome = rs.getString("tema");
					out.println("<tr><td>" + wid + "</td>");		
					out.println("<td>" + wnome + "</td></tr>");
					
		}
		%>
	</table>
</body>
</html>