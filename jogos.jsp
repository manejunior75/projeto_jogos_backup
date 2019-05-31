man<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="Conexao.Conecta"%>

<!DOCTYPE HTML>
<html>
<head>
<style>
.<
style>.coment {
	width: 100%;
	height: 50px;
	background-color: #222;
	font-family: 'Arial';
}

#bt_coment {
	display: none;
}

label[for="bt_coment"] {
	display: none;
}

@media ( max-width :1500px) {
	label[for="bt_coment"] {
		display: block;
	}
	#bt_coment:checked ~.coment {
		margin-left: 0;
	}
	.coment {
		margin-top: 5px;
		margin-left: -150%;
		transition: all .4s;
	}
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
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
}

.btn-link:hover {
	color: #B9CB41;
}
</style>
<title>Streamig | Game Page ::</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!-- Global CSS for the page and tiles -->
<link rel="stylesheet" href="css/main.css">
<!-- //Global CSS for the page and tiles -->
<!---start-click-drop-down-menu----->
<script src="js/jquery.min.js"></script>
<!----start-dropdown--->
<script type="text/javascript">
			var $ = jQuery.noConflict();
				$(function() {
					$('#activator').click(function(){
						$('#box').animate({'top':'0px'},500);
					});
					$('#boxclose').click(function(){
					$('#box').animate({'top':'-700px'},500);
					});
				});
				$(document).ready(function(){
				//Hide (Collapse) the toggle containers on load
				$(".toggle_container").hide(); 
				//Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
				$(".trigger").click(function(){
					$(this).toggleClass("active").next().slideToggle("slow");
						return false; //Prevent the browser jump to the link anchor
				});
									
			});
		</script>
<!----//End-dropdown--->

<!-- Início Script Avaliação -->

<script src="js/funcoes.js"></script>
	
<!-- Fim Script Avaliação -->

</head>
<body>

	<%
	String nomeJogo = request.getParameter("nomeJogo");
	
	int cod=0;
	String nome="";
	String plataforma="";
	String para1="";
	String para2="";
	String para3="";
	String capa="";
	
	try{
		
		Connection con = Conecta.getConnection();
		String sql = "select * from jogos where nome_jogo=?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, nomeJogo);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			cod = (rs.getInt("cod_jogo"));
			nome = (rs.getString("nome_jogo"));
			plataforma = (rs.getString("plataforma"));
			para1 = (rs.getString("info_1"));
			para2 = (rs.getString("info_2"));
			para3 = (rs.getString("info_3"));
			capa = (rs.getString("capa_jogo"));
		}
		
	}catch(Exception e){
			out.print("deu algum erro");
	}
	if(para2.equals("null")){
		para2=" ";
	}
	if(para3.equals("null")){
		para3=" ";
	}
	
	%>
	<!---start-wrap---->
	<!---start-header---->
	<div class="header">
		<div class="wrap">
			<div class="">
				<a href="index.jsp"><img src="images/logo do site" title="" /></a>
			</div>
			<div class="nav-icon">
				<a href="#" class="right_bt" id="activator"><span> </span> </a>
			</div>
			<div class="box" id="box">
				<div class="box_content">
					<div class="box_content_center">
						<div class="form_content">
							<div class="menu_box_list">
								<ul>
									<li><a href="index.jsp"><span>Destaques</span></a></li>
									<li><a href="#"><span>Gêneros</span></a></li>
									<li><a href="#"><span>Plataformas</span></a></li>
									<li><a href="#"><span>Contribua</span></a></li>
									<li><a href="sair.html"><span>Sair</span></a></li>
									<div class="clear"></div>
								</ul>
							</div>
							<a class="boxclose" id="boxclose"> <span> </span></a>
						</div>
					</div>
				</div>
			</div>

			<!--  Barra de Pesquisa -->

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<div class="top-searchbar">
				<form action="pesquisa.jsp" method="post">
					<input type="text" id="nomeJogo" name="nomeJogo"> <input
						type="submit" id="jogos" value="" />
				</form>
			</div>

			<!-- Fim da Barra de Pesquisa -->


			<div class="userinfo">
				<div class="user">
					<ul>
						<li><a href="#"><img src="images/joao.jpg"
								title="Nome-Usuário" /><span>João Valdomiro</span></a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!---//End-header---->
	<!---start-content---->
	<div class="content">
		<div class="wrap">
			<div class="single-page">
				<div class="single-page-artical">
					<div class="artical-content">
						<img src="<%=capa%>" title="banner1">
						<h3>
							<a href="#"><%=nome%></a>
						</h3>
						<p><%=plataforma%></p>
						<p><%=para1%></p>
						<p class="para1"><%=para2%></p>
						<p class="para2"><%=para3%></p>
					</div>
					
					<!-- Aqui é onde entra as estrelas de avaliação-->
					
		        		<h3>Qual nota você daria a este Jogo?</h3>
						<br/>
						<div>
							<a href="javascript:void(0)" onclick="Avaliar(1)">
							<img src="images/star0.png" id="s1"></a>

							<a href="javascript:void(0)" onclick="Avaliar(2)">
							<img src="images/star0.png" id="s2"></a>

							<a href="javascript:void(0)" onclick="Avaliar(3)">
							<img src="images/star0.png" id="s3"></a>

							<a href="javascript:void(0)" onclick="Avaliar(4)">
							<img src="images/star0.png" id="s4"></a>

							<a href="javascript:void(0)" onclick="Avaliar(5)">
							<img src="images/star0.png" id="s5"></a>
						<div/>
						
						<br>	
				
					<!-- Fim do trecho das estrelas -->
					
					<!-- Seção de compartilhamento -->
					
					<div align="center" class="grids_of_3">
						
						<h2>Compartilhe com seus amigos</h2>
						
						<!-- Whatsapp -->
						
						<a href="" id="whatsapp-share-btt" rel="nofollow" target="_blank" class="whatsapp-share-button"></a>
	
					    <script type="text/javascript">
					        //Constrói a URL depois que o DOM estiver pronto
					        document.addEventListener("DOMContentLoaded", function() {
					            //conteúdo que será compartilhado: Título da página + URL
					            var conteudo = encodeURIComponent(document.title + " " + window.location.href);
					            //altera a URL do botão
					            document.getElementById("whatsapp-share-btt").href = "https://api.whatsapp.com/send?text=" + conteudo;
					        }, false);
					    </script>
					    
					    <!-- Facebook -->
					    
					    <a href="" id="facebook-share-btt" rel="nofollow" target="_blank" class="facebook-share-button"></a>
	    
					    <script type="text/javascript">
					        //Constrói a URL depois que o DOM estiver pronto
					        document.addEventListener("DOMContentLoaded", function() {            
					            //altera a URL do botão
					            document.getElementById("facebook-share-btt").href = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(window.location.href);
					        }, false);
					    </script>
					    
					    <!-- Telegram -->
					    
					    <a href="" id="telegram-share-btt" rel="nofollow" target="_blank" class="telegram-share-button"></a>    
					    
					    <script type="text/javascript">
					        //Constrói a URL depois que o DOM estiver pronto
					        document.addEventListener("DOMContentLoaded", function() {
					            var url = encodeURIComponent(window.location.href); //url
					            var title = encodeURIComponent(document.title); //título
					            var telegramLink = "https://telegram.me/share/url?url=" + url + "&text=" + title;
					            document.getElementById("telegram-share-btt").href = telegramLink;
					        }, false);
					    </script>
					    
					    <!-- Twitter -->
					    
					    <a href="" id="twitter-share-btt" rel="nofollow" target="_blank" class="twitter-share-button"></a>
	
					    <script type="text/javascript">
					        //Constrói a URL depois que o DOM estiver pronto
					        document.addEventListener("DOMContentLoaded", function() {
					            var url = encodeURIComponent(window.location.href);
					            var titulo = encodeURIComponent(document.title);
					            //var via = encodeURIComponent("usuario-twitter"); //nome de usuário do twitter do seu site
					            //altera a URL do botão
					            document.getElementById("twitter-share-btt").href = "https://twitter.com/intent/tweet?url="+url+"&text="+titulo;
					            
					            //se for usar o atributo via, utilize a seguinte url
					            //document.getElementById("twitter-share-btt").href = "https://twitter.com/intent/tweet?url="+url+"&text="+titulo+"&via="+via;
					        }, false);
					    </script>
					    
					    <!-- Email -->
					    
					    <a href="" id="mail-share-btt" rel="nofollow" target="_blank" class="mail-share-button"></a>    
					   
					    <script type="text/javascript">
					        //Constrói a URL depois que o DOM estiver pronto
					        document.addEventListener("DOMContentLoaded", function() {
					            var url = window.location.href; //url
					            var title = encodeURIComponent(document.title); //título
					            var mailToLink = "mailto:?subject="+title;
					            
					            //tenta obter o conteúdo da meta tag description
					            var desc = document.querySelector("meta[name='description']");            
					            desc = (!!desc)? desc.getAttribute("content") : null;
					            
					            //se a meta tag description estiver ausente...
					            if(!desc){
					                //...tenta obter o conteúdo da meta tag og:description
					                desc = document.querySelector("meta[property='og:description']");
					                desc = (!!desc)? desc.getAttribute("content") : null;
					            }
					            //Se houver descrição, combina a descrição com a url
					            //senão o corpo da mensagem terá apenas a url
					            var body = (!!desc)? desc + " " + url : url;
					            //altera o link do botão
					            mailToLink = mailToLink + "&body=" + encodeURIComponent(body);
					            document.getElementById("mail-share-btt").href = mailToLink;
					        }, false);
					    </script>
				    
				    </div>
					
					<!-- Fim da Seção compartilhamento -->
				
				<!---Iniciando sessão de comentários--->
				<div class="comment-section">
					<div class="grids_of_2">
						<h2>Comentários</h2>
					<%		
					try{
						String nomeUsuario="";	
						Connection con2 = Conecta.getConnection();
						String sql2 = "select * from postagem where nome_jogo=?";
							
						PreparedStatement stmt2 = con2.prepareStatement(sql2);
						stmt2.setString(1, nomeJogo);
						ResultSet rs2 = stmt2.executeQuery();
						while(rs2.next()){
							nomeUsuario=(rs2.getString("nome_usuario"));
						%>

									<!-- postagem principal -->
									
									<div class="grid1_of_2">
										<div class="grid_img">
											<a href=""><img src="<%out.print(rs2.getString("img_usuario"));%>" alt=""></a>
										</div>
										<div class="grid_text">
											<h4 class="style1 list"><a href="#"><%=nomeUsuario%></a></h4>
											<h3 class="style"><%out.print(rs2.getString("data")+" - "+rs2.getString("hora"));%></h3>
											<p class="para top"><%out.print(rs2.getString("postagem"));%></p>
											<input type="checkbox" id="bt_coment"> 
											<label for="bt_coment" class="btn1">Clique para Responder</label>
											<nav class="coment">
											
											<!-- form para comentar na postagem principal -->
											
												<form action="envia.jsp" method="post">
													<input type="text" id="nomePost" name="nomePost" value="<%=nomeUsuario%>" style="display:none">
													<input type="text" id="nomeJogo1" name="nomeJogo1" value="<%=nomeJogo%>" style="display:none">
													<label>Nome<span>*</span></label> 
													<input type="text" value=" " id="userComent" name="userComent"><br /> 
													<label>Comentario<span>*</span></label>
													<input type="text" value=" " id="comentario" name="comentario"> 
													<input type="submit" value="Enviar">
												</form>
											</nav>
										</div>
										<div class="clear"></div>
									</div>
							<%
							String sql3 = "select * from comentario where nome_jogo = ? and usua_post=?";
							PreparedStatement stmt3 = con2.prepareStatement(sql3);
							stmt3.setString(1, nomeJogo);
							stmt3.setString(2, nomeUsuario);
							ResultSet rs3 =stmt3.executeQuery();
							while(rs3.next()){
								%>
								<div class="grid1_of_2 left">
								<div class="grid_img">
									<a href=""><img src="<%out.print(rs3.getString("img_usuario"));%>" alt=""></a>
								</div>
								<div class="grid_text">
									<h4 class="style1 list"><a href="#"><%out.print(rs3.getString("nome_usuario"));%></a></h4>
								<h3 class="style"><%out.print(rs3.getString("data")+" - "+rs3.getString("hora"));%></h3>
								<p class="para top"><%out.print(rs3.getString("comentario"));%></p>
							</div>
							<div class="clear"></div>
						</div>
								<%
							}
							}
							}catch(Exception e){
								out.print("deu erro: "+e);
							}
							%>
						<div class="artical-commentbox">
							<h2>Deixe seu Comentário</h2>
							<div class="table-form">
								<form action="post.jsp" method="post" name="post_comment">
									<div>
										<label>Nome<span>*</span></label> 
										<input type="text" value=" " id="userPost" name="userPost">
										<input type="text" id="nomeJogo1" name="nomeJogo1" value="<%=nomeJogo%>" style="display:none">
										
									</div>
									<div>
										<label>Seu comentário<span>*</span></label>
										<textarea id="postagem" name="postagem"> </textarea>
									</div>
									<input type="submit" value="Enviar">
								</form>


							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<!---//Final da sessÃ£o dos comentÃ¡rios--->
			</div>
		</div>
	</div>
	<!---//End-wrap---->
</body>
</html>