<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Jogos</title>
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.min.css">
</head>
<body>

<% 
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	if(email.equals("projeto@gmail.com")&& senha.equals("12345")){
		%>
		<div class="container">
		
			<div class="header clearfix">
				<center>
					<h2>Cadastro de Jogos</h2>
				</center>
			</div>
		
			<div class="jumbotron">
				<form action="ok.jsp" method="post">
					<div id="aviso"></div>
					<div class="form-group">
						<center>
							<label>Nome do Jogo</label>
						</center>
						<input type="text" id="nomeDoJogo" class="form-control"
							name="nomeDoJogo" placeholder="Digite o nome do jogo"><br />
						<div class="form-group">
							<center>
								<label>Informa��es Sobre o Jogo</label>
							</center>
							<input type="text" id="info1" class="form-control" name="info1"
								placeholder="Digite o 1� Paragrafo"><br /> <input
								type="text" id="info2" class="form-control" name="info2"
								placeholder="Digite o 2� Paragrafo"><br /> <input
								type="text" id="info3" class="form-control" name="info3"
								placeholder="Digite o 3� Paragrafo"><br />
								
							<center>
								<label>Imagem do Jogo</label>
							</center>
							<input type="text" id="imgJogo" class="form-control"
								name="imgJogo" placeholder="Digite o endere�o da imagem"><br />
		
							<center>
								<label>Capa do jogo</label>
							</center>
							<input type="text" id="capaJogo" class="form-control"
								name="capaJogo" placeholder="Digite o endere�o da imagem"><br />
							
							<center>
								<label>Categoria do jogo</label>
							</center>
							<input type="text" id="categoria" class="form-control"
								name="categoria" placeholder="Digite a categoria do jogo"><br />
						</div>
		
						<center>
							<button type="submit" class="btn btn-primary">Cadastrar</button>
						</center>
						<br>
					</div>
				</form>
				<hr>
				<a href="index.jsp">Cancelar Cadastro</a>
		
			</div>
		</div>
		<div class="col-sm-4"></div>
<%
	}else{
		%>
		<h2>Senha incorreta</h2><%
	}

%>
</body>
</html>