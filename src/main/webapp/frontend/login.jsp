<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
          crossorigin="anonymous">

    <!-- Css Styles -->
    <%--    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">--%>
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

<%-- header --%>
<jsp:include page="header.jsp"/>
<%-- header --%>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <li><a href="#">Fresh Meat</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruit & Nut Gifts</a></li>
                        <li><a href="#">Fresh Berries</a></li>
                        <li><a href="#">Ocean Foods</a></li>
                        <li><a href="#">Butter & Eggs</a></li>
                        <li><a href="#">Fastfood</a></li>
                        <li><a href="#">Fresh Onion</a></li>
                        <li><a href="#">Papayaya & Crisps</a></li>
                        <li><a href="#">Oatmeal</a></li>
                        <li><a href="#">Fresh Bananas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<div class="container-fluid text-center mb-5">
    <div>&nbsp;</div>
    <div class="mb-3">
        <h2>Đăng Nhập</h2>
    </div>

    <form action="" method="post" style="max-width: 350px; margin: 0 auto">
        <div class="border border-secondary rounded p-3">

            <p>
                <input type="email" name="email" class="form-control" placeholder="Tên đăng nhập" required/>
            </p>
            <p>
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required/>
            </p>
            <div class="d-flex align-items-center justify-content-between">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="remember-me"/>&nbsp;Nhớ mật khẩu
                </div>
                <a href="">Quên mật khẩu?</a>
            </div>
            <p>
                <input type="submit" value="Đăng nhập" class="btn btn-primary btn-block"/>
            </p>

            <%-- sử dụng khi sai mật khẩu --%>
<%--            <div class="text-danger mt-2">--%>
<%--                Tài khoản hoặc mật khẩu chưa đúng--%>
<%--            </div>--%>

            <div class="text-center my-3">
                Hoặc
            </div>
            <div class="text-center">
                <a href="" class="btn btn-danger pr-4">
                    <i class="fa-brands fa-google pr-1"></i>Google
                </a>
                <a href="" class="btn btn-primary">
                    <i class="fa-brands fa-facebook pr-1"></i>Facebook
                </a>
            </div>
            <p class="text-center mt-3">Bạn chưa có tài khoản? <a href="">Đăng ký</a></p>
        </div>
    </form>
</div>

<%-- footer --%>
<jsp:include page="footer.jsp"/>
<%-- footer --%>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
