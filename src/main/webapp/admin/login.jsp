<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
</head>
<html>
<head>
    <title>Đăng Nhập - OGANI Admin</title>
</head>
<body>
<div class="container-fluid text-center">

    <div class="mb-5">
        <img src="../images/logo.png"/>
    </div>

    <form action="@{/login}" method="post" style="max-width: 350px; margin: 0 auto">
        <div if="${param.error}">
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
                <a href="#">Quên mật khẩu?</a>
            </div>
            <p class="mt-2">
                <input type="submit" value="Đăng nhập" class="btn btn-primary btn-block"/>
            </p>
        </div>
    </form>

    <div replace="fragments :: footer"></div>

</div>
</body>
</html>
