<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Tema</title>
</head>
<body>
<%@include file ="menu.jsp" %>
	<div class="container"> 
		<div class="header clearfix">
			<h3>Novo tema</h3>		
		</div>
		<div class = "jumbotron">
			<form method ="POST" action ="newTema.jsp"> 
				<div id="aviso"></div>
				<div class="form-group">
					<label>Tema</label>
					<input type="text" required class="form-control" name="txt_tema" placeholder="Digite o nome para o novo tema">					
				</div>
				<button type="submit" class = "btn btn-primary">Guardar</button>
				<button type="reset" class = "btn btn-danger">Cancelar</button>
			</form>
		</div>
	
	</div>
	<%
	String wtema = request.getParameter("txt_tema");
	if(wtema!=null){		
		Connection cn = LigacaoMysql.criarLigacaoMysql();
		Statement st = cn.createStatement();
		ResultSet rs =  st.executeQuery("Select * from temas where tema = '"+wtema+"'");
		if(rs.next()){			
		%>
			<script>
				document.getElementById('aviso').innerHTML="<h3>Tema já Existe</h3>"
			</script>	
		<%
		}
		else{
			st.executeUpdate("insert into temas (tema) values('" + wtema + "')");
		%>
			<script>
				document.getElementById('aviso').innerHTML="<h3>Tema registado</h3>"
			</script>	
		<%
		}
		cn.close();
	}	
	%>
</body>
</html>