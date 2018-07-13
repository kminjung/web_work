<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Maxim - Modern One Page Bootstrap Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/default.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" href="dropzone/dropzone.css" />
</head>
<body>

	<!-- navbar -->
	<div class="navbar-wrapper">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<!-- Responsive navbar -->
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
				</a>
					<h1 class="brand"><a href="#">Maxim</a></h1>
					<!-- navigation -->
					<nav class="pull-right nav-collapse collapse">
						<%
							// context path 읽어오기
							String cPath=request.getContextPath();
							//session 에 "id" 라는 키값으로 담겨 있는 문자열을 읽어본다
							String id=(String)session.getAttribute("id");
						%>
						<%if(id!=null){ %>
							<a href="users/logout.jsp"></a>
							<ul id="menu-main" class="nav">
								<li><a title="team" href="#about">About</a></li>
								<li><a title="services" href="#services">Services</a></li>
								<li><a title="works" href="#works">Works</a></li>
								<li><a title="blog" href="#blog">Blog</a></li>
								<li><a title="upload" href="#upload">Upload</a></li>
								<li><a title="contact" href="#contact">Contact</a></li>
								<li><a href="users/private/info.jsp"><p><strong><%=id %></strong>님 로그인중</p></a></li>
								<li><a href="users/logout.jsp">logout</a></li>
							</ul>
							
						<%}else { %>
							<ul id="menu-main" class="nav">
								<li><a title="team" href="#about">About</a></li>
								<li><a title="services" href="#services">Services</a></li>
								<li><a title="works" href="#works">Works</a></li>
								<li><a title="blog" href="#blog">Blog</a></li>
								<li><a title="upload" href="#upload">Upload</a></li>
								<li><a title="contact" href="#contact">Contact</a></li>
								<li><a href="users/loginform.jsp">login</a></li>
								
							</ul>
						<%} %>			
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Header area -->
	<div id="header-wrapper" class="header-slider">
		<header class="clearfix">
			<div class="logo">
				<img src="img/logo-image.png" alt="" />
			</div>
			<div class="container">
				<div class="row">
					<div class="span12">
						<div id="main-flexslider" class="flexslider">
							<ul class="slides">
								<li>
									<p class="home-slide-content">
										<strong>creative</strong> and passion
									</p>
								</li>
								<li>
									<p class="home-slide-content">
										Eat and drink <strong>design</strong>
									</p>
								</li>
								<li>
									<p class="home-slide-content">
										We loves <strong>simplicity</strong>
									</p>
								</li>
							</ul>
						</div>
						<!-- end slider -->
					</div>
				</div>
			</div>
		</header>
	</div>
	<!-- spacer section -->
	<section class="spacer green">
		<div class="container">
			<div class="row">
				<div class="span6 alignright flyLeft">
					<blockquote class="large">
						There's huge space beetween creativity and imagination <cite>Mark Simmons, Nett Media</cite>
					</blockquote>
				</div>
				<div class="span6 aligncenter flyRight">
					<i class="icon-coffee icon-10x"></i>
				</div>
			</div>
		</div>
	</section>
	<!-- end spacer section -->
	<!-- section: team -->
	<section id="about" class="section">
		<div class="container">
			<h4>Who We Are</h4>
			<div class="row">
				<div class="span4 offset1">
					<div>
						<h2>We live with <strong>creativity</strong></h2>
						<p>
							Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe
							al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.
						</p>
					</div>
				</div>
				<div class="span6">
					<div class="aligncenter">
						<img src="img/icons/creativity.png" alt="" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="span2 offset1 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/img-1.jpg" alt="" />
						<h3>John Doe</h3>
						<p>
							Art director
						</p>
					</div>
				</div>
				<div class="span2 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/img-2.jpg" alt="" />
						<h3>Mike Doe</h3>
						<p>
							Web developer
						</p>
					</div>
				</div>
				<div class="span2 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/img-3.jpg" alt="" />
						<h3>Neil Doe</h3>
						<p>
							Web designer
						</p>
					</div>
				</div>
				<div class="span2 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/img-4.jpg" alt="" />
						<h3>Mark Joe</h3>
						<p>
							UI designer
						</p>
					</div>
				</div>
				<div class="span2 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/img-5.jpg" alt="" />
						<h3>Stephen B</h3>
						<p>
							Digital imaging
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</section>
	<!-- end section: team -->
	<!-- section: services -->
	<section id="services" class="section orange">
		<div class="container">
			<h4>Services</h4>
			<!-- Four columns -->
			<div class="row">
				<div class="span3 animated-fast flyIn">
					<div class="service-box">
						<img src="img/icons/laptop.png" alt="" />
						<h2>Web design</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting industry.
						</p>
					</div>
				</div>
				<div class="span3 animated flyIn">
					<div class="service-box">
						<img src="img/icons/lab.png" alt="" />
						<h2>Web development</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting industry.
						</p>
					</div>
				</div>
				<div class="span3 animated-fast flyIn">
					<div class="service-box">
						<img src="img/icons/camera.png" alt="" />
						<h2>Photography</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting industry.
						</p>
					</div>
				</div>
				<div class="span3 animated-slow flyIn">
					<div class="service-box">
						<img src="img/icons/basket.png" alt="" />
						<h2>Ecommerce</h2>
						<p>
							Lorem Ipsum is simply dummy text of the printing and typesetting industry.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end section: services -->
	<!-- section: works -->
	<section id="works" class="section">
		<div class="container clearfix">
			<h4>Our Works</h4>
			<!-- portfolio filter -->
			<div class="row">
				<div id="filters" class="span12">
					<ul class="clearfix">
						<li>
							<a href="#" data-filter="*" class="active">
								<h5>All</h5>
							</a>
						</li>
						<li>
							<a href="#" data-filter=".web">
								<h5>Web</h5>
							</a>
						</li>
						<li>
							<a href="#" data-filter=".print">
								<h5>Print</h5>
							</a>
						</li>
						<li>
							<a href="#" data-filter=".design">
								<h5>Design</h5>
							</a>
						</li>
						<li>
							<a href="#" data-filter=".photography">
								<h5>Photography</h5>
							</a>
						</li>
					</ul>
				</div>
				<!-- END PORTFOLIO FILTERING -->
			</div>
			<div class="row">
				<div class="span12">
					<div id="portfolio-wrap">
						<!-- portfolio item -->
						<div class="portfolio-item grid print photography">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/1.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid print design web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/2.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid print design">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/3.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/4.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/5.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/6.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/7.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/8.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid photography web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/9.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
						<!-- portfolio item -->
						<div class="portfolio-item grid design web">
							<div class="portfolio">
								<a href="img/works/big.jpg" data-pretty="prettyPhoto[gallery1]" class="portfolio-image">
						<img src="img/works/10.png" alt="" />
						<div class="portfolio-overlay">
							<div class="thumb-info">
								<h5>Portfolio name</h5>
								<i class="icon-plus icon-2x"></i>
							</div>
						</div>
						</a>
							</div>
						</div>
						<!-- end portfolio item -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- spacer section -->
	<section class="spacer bg3">
		<div class="container">
			<div class="row">
				<div class="span12 aligncenter flyLeft">
					<blockquote class="large">
						We are an established and trusted web agency with a reputation for commitment and high integrity
					</blockquote>
				</div>
				<div class="span12 aligncenter flyRight">
					<i class="icon-rocket icon-10x"></i>
				</div>
			</div>
		</div>
	</section>
	<!-- end spacer section -->
	<!-- section: blog -->
	<section id="blog" class="section">
	<%
	//글 목록 불러오기
	List<BoardDto> list=BoardDao.getInstance().getList();
	%>
	<div class="container">
		<h4>Blog  board</h4>
		<!-- blog table -->
		<div class="row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<%for(BoardDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><a href="board/detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>	
		</div>
	</div>
		<div class="blankdivider30"></div>
		<div class="aligncenter">
			<a href="board/insertform.jsp" class="btn btn-large btn-theme" id="Bbtn">Blog Write</a>
			<script>
			
			</script>
		</div>
		
	</div>
	</section>
	<!-- end spacer blog -->
	
	<!-- section: contact -->
	<section id="upload" class="section">
		<div class="container">
			<h4>업로드</h4>
				<form action="dropzone/upload.jsp" method="post"
					class="dropzone" id="myForm" enctype="multipart/form-data">			
					<input type="file" name="myFile" />
				</form>



		</div>
	</section>
	<!-- end spacer section -->
	<!-- section: contact -->
	<section id="contact" class="section green">
	
		<div class="container">
			<h4>Get in Touch</h4>
			<p>
				Reque facer nostro et ius, cu persius mnesarchum disputando eam, clita prompta et mel vidisse phaedrum pri et. Facilisis posidonium ex his. Mutat iudico vis in, mea aeque tamquam scripserit an, mea eu ignota viderer probatus. Lorem legere consetetur ei
				eum. Sumo aeque assentior te eam, pri nominati posidonium consttuam
			</p>
			<div class="blankdivider30">
			</div>
			<div class="row">
				<div class="span12">
					<div class="cform" id="contact-form">
						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>
						<form action="" method="post" role="form" class="contactForm">
							<div class="row">
								<div class="span6">
									<div class="field your-name form-group">
										<input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
										<div class="validation"></div>
									</div>
									<div class="field your-email form-group">
										<input type="text" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
										<div class="validation"></div>
									</div>
									<div class="field subject form-group">
										<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
										<div class="validation"></div>
									</div>
								</div>
								<div class="span6">
									<div class="field message form-group">
										<textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
										<div class="validation"></div>
									</div>
									<input type="submit" value="Send message" class="btn btn-theme pull-left">
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- ./span12 -->
			</div>
		</div>
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<div class="span6 offset3">
					<ul class="social-networks">
						<li><a href="#"><i class="icon-circled icon-bgdark icon-instagram icon-2x"></i></a></li>
						<li><a href="#"><i class="icon-circled icon-bgdark icon-twitter icon-2x"></i></a></li>
						<li><a href="#"><i class="icon-circled icon-bgdark icon-dribbble icon-2x"></i></a></li>
						<li><a href="#"><i class="icon-circled icon-bgdark icon-pinterest icon-2x"></i></a></li>
					</ul>
					<p class="copyright">
						&copy; Maxim Theme. All rights reserved.
						<div class="credits">
							<!--
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Maxim
              -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</p>
				</div>
			</div>
		</div>
		<!-- ./container -->
	</footer>
	<a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bgdark icon-2x"></i></a>
	<script src="dropzone/dropzone.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.nav.js"></script>
	<script src="js/jquery.localScroll.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/isotope.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/inview.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/contactform/contactform.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>

</body>
</html>