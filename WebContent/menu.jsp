<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<style>
	body{
		margim: 0px;
	}
	.dropbtn{
		background-color: #4CAF50;
		color:white;
		padding: 15px;
		font-size:15px;
		border:none;
		cursor:pointer;		
	}
	.dropdown{
			
		position: relative;
		display: inline-block;
	}
	.dropdown-conteudo{
		display:none;
		position:absolute;
		background-color: #f9f9f9;
		min-width: 150px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		zindex: -1;
	}
	.dropdown-conteudo a{
		color: black;
		padding: 12px;
		text-decoration:none;
		display: block;
	}
	.dropdown-conteudo a:hover{
		background-color: #f1f1f1;	
	}
	.dropdown:hover .dropdown-conteudo{
		display:block;
	}
	.dropdown:hover .dropbtn{
		background-color: #3e8e41;
	}
	
</style>
</head>
<body>
	<div style="width:100%; background-color:#3e8e41" >
		<div class="dropdown">
			<button class ="dropbtn">Temas</button>
			<div class="dropdown-conteudo">
				<a href="newTema.jsp">Novo Tema</a>
				<a href="listagemtema.jsp">Lista Temas</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Escritores</button>
			<div class="dropdown-conteudo">
				<a href="newEscritor.jsp">Novo escritor</a>
				<a href="listagemescritor.jsp">Lista escritores</a>
			</div>
		</div>
		<div class="dropdown">
			<button class ="dropbtn">Livros</button>
			<div class="dropdown-conteudo">
				<a href="newLivro.jsp">Novo Livro</a>
				<a href="listagemlivro.jsp">Lista livros</a>
			</div>
		</div>
	
	</div>

</body>
</html>