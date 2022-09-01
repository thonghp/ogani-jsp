<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div>

    <!-- navigation -->
    <nav class="navbar navbar-expand-lg bg-light navbar-light">
        <!-- logo -->
        <a href="" class="navbar-brand">
            <img src="../images/logo.png" alt="">
        </a>
        <!-- toggle -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- điều hướng -->
        <div class="collapse navbar-collapse" id="topNavbar">
            <ul class="navbar-nav">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">Nhân viên</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="">Tạo mới</a>
                        <a class="dropdown-item" href="list_users">Xem tất cả</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown">Thể loại</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="">Tạo mới</a>
                        <a class="dropdown-item" href="list_categories">Xem tất cả</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">Sách</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="">Tạo mới</a>
                        <a class="dropdown-item" href="list_books">Xem tất cả</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="list_customers" class="nav-link">Khách Hàng</a>
                </li>

                <li class="nav-item">
                    <a href="list_reviews" class="nav-link">Review</a>
                </li>

                <li class="nav-item">
                    <a href="list_orders" class="nav-link">Order</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">Cài đặt</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="">Chung</a>
                        <a class="dropdown-item" href="">Quốc Gia</a>
                        <a class="dropdown-item" href="">Thành Phố</a>
                        <a class="dropdown-item" href="">Mail Server</a>
                        <a class="dropdown-item" href="">Mail Template</a>
                        <a class="dropdown-item" href="">Payment</a>
                    </div>
                </li>

                <li>
                    <span class="fas fa-user fa-2x icon-silver"></span>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">Xin chào, Admin</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="">Tài khoản của tôi</a>
                        <a class="dropdown-item" id="logoutLink" href="Logout">Đăng xuất</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>