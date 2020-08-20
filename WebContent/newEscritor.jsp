<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="ligarBD.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>Escritores</title>
</head>
<body>
<%@include file ="menu.jsp" %>
    <div class="container">
        <div class="header clearfix">
            <h3>Novo Escritor</h3>
        </div>
        <div class="jumbotron">
            <form method="POST" action="newEscritor.jsp">
                <div id="aviso"></div>
                <div class="form-group">
                    <label>Nome</label>
                    <input type="text" required class="form-control" name="txt_nome"
                    placeholder="Digite o nome para o novo escritor">
                    <br>   
                    <input type="text" required class="form-control" name="txt_foto"
                    placeholder="Digite o nome da foto">                   
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <button type="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
    </div>
    <%
        String wnome=request.getParameter("txt_nome");
        String wfoto=request.getParameter("txt_foto");
        if (wnome!=null){        
            Connection cn = LigacaoMysql.criarLigacaoMysql();
           Statement st=cn.createStatement();
           ResultSet rs=st.executeQuery("select * from escritores where nome='"+wnome+"'");
            if(rs.next()){
            %>
                <script>
                        document.getElementById('aviso').innerHTML="<h3 style='color:red;'>Nome já Existe</h3>";
                </script>
            <%  
            }
            else{
          
           // executar o comando de insert into
           st.executeUpdate("insert into escritores (nome,foto) values('"+wnome+"','"+wfoto+"')");
           %>
               <script>
                       document.getElementById('aviso').innerHTML="<h3 style='color:green;'>Escritor registado.</h3>";
               </script>
           <%
           cn.close();
            }
        }  
    %>
</body>
</html>