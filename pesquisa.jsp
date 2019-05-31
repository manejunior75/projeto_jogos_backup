<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="Conexao.Conecta"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  width: 20%;
}

th, td {
  padding: 2px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}
.btn-link {
			border: none;
			outline: none;
			background: none;
			cursor: pointer;
			color: #717171;
			font-family: inherit;
			font-size: 1.2em;
			display: block;
			transition:0.5s all;
			-webkit-transition:0.5s all;
			-moz-transition:0.5s all;
			-o-transition:0.5s all;
		}
		.btn-link:hover{
			color:#B9CB41;
		}
</style>
</head>
<body>
<%
						String nomeJogo = request.getParameter("nomeJogo");
						String nome="";
						String img="";
					
						if(nomeJogo.equals("gta v") || nomeJogo.equals("gta 5") || nomeJogo.equals("gta")){
							nomeJogo="grand theft auto v";
						}
						try{
							Connection con = Conecta.getConnection();
							String sql = "select nome_jogo, img_jogo from jogos where nome_jogo like ?";
							PreparedStatement stmt = con.prepareStatement(sql);
							stmt.setString(1, "%"+nomeJogo+"%");
							ResultSet rs = stmt.executeQuery();
							while (rs.next()) {
								nome = (rs.getString("nome_jogo"));
								img = (rs.getString("img_jogo"));
								%>
								<form action="jogos.jsp" method="post">
								<input type="text" value="<%=nome%>" id="nomeJogo" name="nomeJogo" style="display:none">
								<table align="center">
									<tr>
										<td><img src="<%=img%>"widht="40" height="40"></td>
										<td><h3><button type="submit" class="btn-link"><%=nome%></button></h3></td>
									</tr>
									</table>
								</form>
								<%
							}
						}catch(Exception e){
							out.print("Deu erro: "+e);
						}
%>

</body>
</html>