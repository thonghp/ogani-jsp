<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
</head>
<body>
<div class="container-fluid text-center">
    <div th:replace="navigation :: header_menu"/>
    <div>&nbsp;</div>
    <div>
        <h2>Đăng Nhập</h2>
    </div>

    <form th:action="@{/login}" method="post" style="max-width: 350px; margin: 0 auto">
        <div th:if="${param.error}">
            Tài khoản hoặc mật khẩu chưa đúng
        </div>
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
                <a th:href="@{/forgot_password}">Quên mật khẩu?</a>
            </div>
            <p>
                <input type="submit" value="Đăng nhập" class="btn btn-primary btn-block"/>
            </p>
            <div class="text-center my-3">
                Hoặc
            </div>
            <div class="text-center">
                <a th:href="@{/oauth2/authorization/google}" class="btn btn-danger pr-4">
                    <i class="fa-google pr-1"></i>Google
                </a>
                <a th:href="@{/oauth2/authorization/facebook}" class="btn btn-primary">
                    <i class="fa-facebook pr-1"></i>Facebook
                </a>
            </div>
            <p class="text-center mt-3">Bạn chưa có tài khoản? <a th:href="@{/register}">Đăng ký</a></p>
        </div>
    </form>

    <div th:replace="navigation :: footer_menu"></div>

</div>
</body>
</html>
