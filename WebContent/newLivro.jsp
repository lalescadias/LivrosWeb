<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Livro</title>
</head>
<body>
<%@include file ="menu.jsp" %>
	<div class="container">
		<div class="header clearfix">
			<h3>Novo Livro</h3>
		</div>
		<div class="jumbotron">
			<form method="POST" action="newLivro.jsp">
				<div id="aviso"></div>
				<div class="form-group">
					<label>Data de aquisição</label> <input type="date" required
						class="form-control" name="txt_data"
						placeholder="Digite a data de aquisicao">
				</div>
				<div class="form-group">
					<label>Tema</label> <select name="txt_tema" class="form-control">
						<option>-</option>
						<%
							String tema;
						int codigoTema;
						Connection cn = LigacaoMysql.criarLigacaoMysql();
						Statement st = cn.createStatement();
						ResultSet rs = st.executeQuery("Select * from temas");
						while (rs.next()) {
							codigoTema = rs.getInt("cod_tema");
							tema = rs.getString("tema");
							out.println("<option value=" + codigoTema + ">" + tema + "</option>");
						}
						cn.close();
						%>
					</select>
				</div>
				<div class="form-group">
					<label>Titulo</label> <input type="text" required
						class="form-control" name="txt_titulo"
						placeholder="Digite o titulo do livro">
				</div>
				<div class="form-group">
					<label>Escritor</label> <select name="txt_escritor"
						class="form-control">
						<option>-</option>
						<%
						String nome;
						int codigoEscritor;
						Connection cn1 = LigacaoMysql.criarLigacaoMysql();
						Statement st1 = cn1.createStatement();
						ResultSet rs1 = st1.executeQuery("Select * from escritores");
						while (rs1.next()) {
							codigoEscritor = rs1.getInt("cod_escritor");
							nome = rs1.getString("nome");
							out.println("<option value=" + codigoEscritor + ">" + nome + "</option>");
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label>Ano de publicacao</label> <input type="text" required
						class="form-control" name="txt_ano"
						placeholder="Digite o ano de publicacao">
				</div>
				<div class="form-group">
					<label>Preço</label> <input type="text" required
						class="form-control" name="txt_preco"
						placeholder="Digite o preço do livro">
				</div>
				<button type="submit" class="btn btn-primary">Guardar</button>
				<button type="reset" class="btn btn-danger">Cancelar</button>
			</form>
		</div>

	</div>
	<%
	String wdata = request.getParameter("txt_data");
	String wtema = request.getParameter("txt_tema");
	String wtitulo = request.getParameter("txt_titulo");
	String wescritor = request.getParameter("txt_escritor");
	String wano = request.getParameter("txt_ano");
	String wpreco = request.getParameter("txt_preco");
	 if (wtitulo!=null){        
		 Connection cn2 = LigacaoMysql.criarLigacaoMysql();
		 Statement st2 = cn2.createStatement();
		 ResultSet rs2 =  st2.executeQuery("Select * from livros where titulo = '"+wtitulo+"'");
         if(rs2.next()){
         %>
             <script>
                     document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Livro já Existe</h3>";
             </script>
         <%  
         }
         else{
       
        	 st2.executeUpdate("insert into livros (data_aquisicao, cod_tema , titulo, cod_escritor,ano_publicacao,preco)values('" + wdata + "','" + wtema + "','"
     				+ wtitulo + "','" + wescritor + "','" + wano + "','" + wpreco + "')");
        %>
            <script>
                    document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Livro registado.</h3>";
            </script>
        <%
        cn.close();
         }
     }
			
	%>
</body>
</html>