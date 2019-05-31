<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="Conexao.Conecta"%>
<!DOCTYPE HTML>
<html>
<a href="https://api.whatsapp.com/send?l=pt&amp;phone=5583999509553"><img src="https://i.imgur.com/XMsxHpu.png" style="height:80px; position:fixed; bottom: 25px; right: 25px; z-index:100;" data-selector="img"></a>
<head>	

<!-- Estilizando botão para ficar igual um href -->

<style>
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

<!-- Fim da estilização -->

		<title>Streamig | Home :: Jogos em Destaque</title>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!----webfonts---->
		<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<!-- Global CSS for the page and tiles -->
  		<link rel="stylesheet" href="css/main.css">
  		<!-- //Global CSS for the page and tiles -->
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
        <!----Fim do dropdown--->
	</head>
	<body>
		<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				
				<!-- Menu do site -->
				
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
										<li><a href="CadastroDeJogos.jsp"><span>Cadastrar Jogos</span></a></li>
										<!--<li><a href="sair.html"><span>Sair</span></a></li>-->										
										<div class="clear"> </div>
									</ul>
								</div>
								<a class="boxclose" id="boxclose"> <span> </span></a>
							</div>                                  
						</div> 	
					</div> 
				</div>
				
	<!-- Fim do Menu -->
				
	<!--  Barra de Pesquisa -->
	
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<div class="top-searchbar">
					<form action="pesquisa.jsp" method="post">
						<input type="text" id="nomeJogo" name="nomeJogo">						
						<input type="submit" id="jogos" value=""/>
					</form>
				</div>
				
				<!-- Fim da Barra de Pesquisa -->
				
				<!-- Login com o google -->
				
				<div class="userinfo">
					<div class="user">
						<ul>
							<li><a href="login.php"><img src="images/google.png"/></a></li>
						</ul>
					</div>				
				</div>
				<div class="clear"> </div>
			</div>
		</div>
		<!---//End-header---->
		<!---start-content---->
		<div class="content">
			<div class="wrap">
			 <div id="main" role="main">
			      <ul id="tiles">
			      
					<!-- Aqui começa a pagina de verdade, com o grid de jogos -->
					
					<%
						try {
							
							//Conectando ao banco de dados
							
							Connection con = Conecta.getConnection();
							String sql = "select * from jogos where categoria='Destaques'";
							
							//Selecionando todos os jogos q estiverem na categoria 'Destaques' no banco de dados
							
							PreparedStatement stmt = con.prepareStatement(sql);
							ResultSet rs = stmt.executeQuery();
							
							//While para mostrar todos os jogos do banco 
							//Enquanto estiver jogos na categoria 'Destaques' o while estara mostrando
							
							while (rs.next()) {
								%>
								<li onclick="location.href='jogos.jsp';"><img src="<%out.print(rs.getString("img_jogo"));%>" width="180" height="208">
								<div class="post-info">
									<div class="post-basic-info">
										<form action="jogos.jsp" method="post" id="envia">
											<input type="text" value="<%out.print(rs.getString("nome_jogo"));%>" name="nomeJogo" id="nomeJogo" style="display: none">
											<h3><button type="submit" class="btn-link"><%out.print(rs.getString("nome_jogo"));%></button></h3>
											<!-- <span><a href="#"><label> </label>Saiba Mais</a></span>-->
										</form>
									</div>
								</div>
								</li>
								<%
							}
						} catch (Exception e) {
							out.print("deu erro: " + e);
						}
					%>
					
					<!-- Fim do Grid de jogos -->
					
			      </ul>
			    </div>
			</div>
		</div>
		<!---//End-content---->
		<!----wookmark-scripts---->
		  <script src="js/jquery.imagesloaded.js"></script>
		  <script src="js/jquery.wookmark.js"></script>
		  <script type="text/javascript">
		    (function ($){
		      var $tiles = $('#tiles'),
		          $handler = $('li', $tiles),
		          $main = $('#main'),
		          $window = $(window),
		          $document = $(document),
		          options = {
		            autoResize: true, // This will auto-update the layout when the browser window is resized.
		            container: $main, // Optional, used for some extra CSS styling
		            offset: 20, // Optional, the distance between grid items
		            itemWidth:280 // Optional, the width of a grid item
		          };
		      /**
		       * Reinitializes the wookmark handler after all images have loaded
		       */
		      function applyLayout() {
		        $tiles.imagesLoaded(function() {
		          // Destroy the old handler
		          if ($handler.wookmarkInstance) {
		            $handler.wookmarkInstance.clear();
		          }
		
		          // Create a new layout handler.
		          $handler = $('li', $tiles);
		          $handler.wookmark(options);
		        });
		      }
		      /**
		       * When scrolled all the way to the bottom, add more tiles
		       */
		      
		
		      // Call the layout function for the first time
		      applyLayout();
		
		      // Capture scroll event.
		      $window.bind('scroll.wookmark', onScroll);
		    })(jQuery);
		  </script>
		<!----//wookmark-scripts---->
		<!----start-footer--->

		<!----//End-footer--->
		<!---//End-wrap---->
				
	</body>
</html>