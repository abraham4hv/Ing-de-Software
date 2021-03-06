<%-- 
    Document   : reservaciones
    Created on : Nov 3, 2017, 9:22:41 PM
    Author     : sotg10
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" import="kitchen.modelo.Consultas" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="kitchen.modelo.Consultas" scope="page">
    <jsp:setProperty name="bean" property="*"></jsp:setProperty>
</jsp:useBean><html lang="en">
    <head>
        <title>Kitchen|Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta name="keywords" content="Kitchen Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- bootstrap-css -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--// bootstrap-css -->
        <!-- css -->
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <!--// css -->
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- //font-awesome icons -->
        <!-- font -->
        <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Great+Vibes&amp;subset=latin-ext" rel="stylesheet">
        <!-- //font -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script> 

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <![endif]-->
    </head>
    <body>
        <%
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        username = cookie.getValue();
                    }
                }
            }

            if (username == null) {
                response.sendRedirect("login.jsp");
            }

            String pathEmpty = "images/empty.png";
            String pahtFull = "mages/full.png";
            Consultas consultas = new Consultas();
        %>
        <!-- banner -->
        <div class="banner jarallax">
            <!-- agileinfo-dot -->
            <div class="agileinfo-dot">
                <div class="w3layouts-header-top">
                    <div class="w3-header-top-grids">
                        <!--<div class="w3-header-top-left">
                                <p><i class="fa fa-volume-control-phone" aria-hidden="true"></i> +1 234 567 8901</p>
                        </div>-->
                        <div class="w3-header-top-right">
                            <div class="agileinfo-social-grids">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                            <div class="w3-header-top-right-text">
                                <p><i class="fa fa-home" aria-hidden="true"></i> Zona 10, Ciudad de Guatemala</p>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="head">
                    <div class="head-nav-grids">
                        <div class="navbar-top">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <div class="navbar-brand logo ">
                                    <img src="images/Logo/White/PNG/name_0.png" alt="">
                                </div>

                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav link-effect-4">
                                    <li class="active"><a href="index.jsp" data-hover="Inicio">Inicio</a> </li>
                                    <li><a href="nosotros.html" data-hover="Nosotros">Nosotros </a> </li>
                                    <li><a href="galeria.jsp"  data-hover="Galeria">Galería</a></li>
                                    <li><a href="reservaciones.html" data-hover="Reservaciones">Reservaciones</a></li>
                                    <li class="dropdown">
                                        <a href="perfilUsuario.jsp" class="dropdown-toggle" data-hover="Perfil" data-toggle="dropdown">Perfil <%= username%><b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="misReservaciones.jsp">Mis Reservaciones</a></li>
                                            <li><a href="logout" data-hover="logout">Cerrar Sesion</a></li>
                                        </ul>
                                    </li>

                                </ul>
                            </div>><!-- /.navbar-collapse -->
                        </div>

                        <div class="header-left">
                            <ul>
                                <li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:kitchenguate@gmail.com">kitchenguate@gmail.com</a></li>
                                <li><i class="fa fa-fax" aria-hidden="true"></i> 2400 1006</li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>	
                    </div>
                </div>
                <div class="w3-agile-main-heading">
                    <h2>Reservaciones</h2>
                </div>
            </div>
            <!-- //agileinfo-dot -->
        </div>
        <!-- //banner -->
        <!-- contact -->
        <div class="center-block contact-content">
            <div class="container">
                <div class="contact-form">
                    <form action="reservar" method="post">

                        <input type="text" name="nickname" value="<%= username%>" readonly placeholder="<%= username%>" required="">
                        <input type="text" name="nombreReserva" placeholder="A nombre de:" required="">
                        <input type="number" name="mesaId" min="1" placeholder="No. Mesa" required="">
                        <input type="number" name="noPesonas" min="1" placeholder="No. Personas" required="">
                        <input type="date" name="dia" placeholder="Dia de reservacion: DD/MM/YYYY" required="">
                        <input type="time" name="hora" min="1" placeholder="Hora" required="">
                        <br>
                        <input type="submit" value="Reservar">
                    </form>
                </div>
                <%
                    List<JSONObject> list = new ArrayList<>();
                    list = bean.getReservado();

                %>
                <img class="rounded" alt="Mesa 1" style="width: 175px; height: 175px; margin-right: 100px;" <%if (!consultas.ocupado(list, "1")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 2" style="width: 175px; height: 175px; margin-right: 100px;" <%if (!consultas.ocupado(list, "2")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 3" style="width: 175px; height: 175px; margin-right: 100px;" <%if (!consultas.ocupado(list, "3")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 4" style="width: 175px; height: 175px; margin-right: 100px;" <%if (!consultas.ocupado(list, "4")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 5" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "5")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 6" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "6")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 7" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "7")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 8" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "8")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 9" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "9")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">
                <img class="rounded" alt="Mesa 10" style="width: 175px; height: 175px; margin-right: 100px; margin-top: 50px;" <%if (!consultas.ocupado(list, "10")) {%>src="images/empty.png"<%} else { %>src="images/full.png"<%}%> data-holder-rendered="true">

            </div>
        </div> 			
    </div>
    <!-- //contact -->
    <!-- footer -->
    <div class="w3-agile-footer">
        <div class="container">
            <div class="footer-grids">
                <div class="col-md-3 footer-grid">
                    <div class="footer-grid-heading">
                        <img src="images/Logo/White/PNG/name_0.png" alt="">	
                    </div>
                    <div class="agile-footer-info">
                        <p>Kitchen es un restaurante 100% guatemalteco y cree en su gente, todos nuestros productos son nacionales.</p>
                    </div>
                    <div class="social">
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 footer-grid">
                    <div class="footer-grid-heading">
                        <h4>Dirección</h4>
                    </div>
                    <div class="footer-grid-info">
                        <p>
                            <span>Ciudad de Guatemala</span>
                        </p>
                        <p class="phone">Teléfono : (502) 2440-0000
                            <span>Email : <a href="mailto:kitchenguate@gmail.com">kitchenguate@gmail.com</a></span>
                            <span>FAX : (502) 2440-0101</span>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 footer-grid">
                    <div class="footer-grid-heading">
                        <h4>Navegación</h4>
                    </div>
                    <div class="footer-grid-info">
                        <ul>
                            <li><a href="index.html">Inicio</a></li>
                            <li><a href="nosotros.html">Nosotros</a></li>
                            <li><a href="galeria.html">Galería</a></li>
                            <li><a href="reservaciones.html">Reservaciones</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 footer-grid">
                    <div class="footer-grid-heading">
                        <h4>Twitter Posts</h4>
                    </div>
                    <div class="agile-footer-grid">
                        <ul class="w3agile_footer_grid_list">
                            <li>Este viernes tendremos música en vivo! Reserva tu mesa en: <a href="#">kitchenguate@gmail.com</a>
                                <span><i class="fa fa-twitter" aria-hidden="true"></i> 02 days ago</span></li>
                            <li>Recuerda que la próxima semana todo el menú estará al 2X1! Reserva ya en: <a href="#">kitchenguate@gmail.com</a><span><i class="fa fa-twitter" aria-hidden="true"></i> 03 days ago</span></li>
                        </ul>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="agileits-w3layouts-copyright">
                <p>© 2017 Kitchen . Todos los Derechos Reservados</p>
            </div>
        </div>
    </div>
    <!-- //footer -->
    <script src="js/jarallax.js"></script>
    <script src="js/SmoothScroll.min.js"></script>
    <script type="text/javascript">
            /* init Jarallax */
            $('.jarallax').jarallax({
                speed: 0.5,
                imgWidth: 1366,
                imgHeight: 768
            })
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <!-- here stars scrolling icon -->
    <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
    </script>
    <!-- //here ends scrolling icon -->
</body>	
</html>