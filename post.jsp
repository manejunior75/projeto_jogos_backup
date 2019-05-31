<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="Conexao.Conecta" 
    import="java.text.DateFormat" import="java.util.Date" import="java.util.Locale"
    import="java.text.SimpleDateFormat"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String data="";
	Date dataAtual = new Date();
	DateFormat formatador = DateFormat.getDateInstance(DateFormat.FULL, new Locale("pt","BR"));
	String dataExtenso = formatador.format(dataAtual);
	
	int index = dataExtenso.indexOf(",");
	int lenght = dataExtenso.length();
	data=(dataExtenso.substring(++index, lenght));
	
	SimpleDateFormat horaFormatada= new SimpleDateFormat("HH:mm:ss");
	String hora = horaFormatada.format(dataAtual);

	String userPost = request.getParameter("userPost");
	String postagem = request.getParameter("postagem");
	String nomeJogo = request.getParameter("nomeJogo1");
	String imgUsuario="null";
	
	try{
		
		Connection con = Conecta.getConnection();
		String sql = "insert into postagem(nome_usuario, img_usuario, postagem, data, hora, nome_jogo) values(?,?,?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, userPost);
		stmt.setString(2, imgUsuario);
		stmt.setString(3, postagem);
		stmt.setString(4, data);
		stmt.setString(5, hora);
		stmt.setString(6, nomeJogo);
		stmt.execute();
		stmt.close();
		con.close();
		
		out.print("comentario inserido com sucesso!");
		
	}catch(Exception e){
		out.print("deu erro: "+e);
	}
%>
<form action="jogos.jsp" method="post">
	<button type="submit" value="<%=nomeJogo%>" name="nomeJogo" id="nomeJogo">ok</button>

</form>

</body>
</html>