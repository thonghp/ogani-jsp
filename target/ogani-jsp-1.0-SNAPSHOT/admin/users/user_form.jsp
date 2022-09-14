<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thêm nhân viên</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
<div class="container-fluid">

    <!-- navigation -->
    <jsp:include page="../header.jsp"/>

    <!-- user form -->
    <div class="mb-5">
        <h2>Quản lý user | [[${pageTitle}]]</h2>
    </div>
    <!-- user form -->

    <form action="create_user" method="post" style="max-width: 700px; margin: 0 auto"
          onsubmit="return checkEmailUnique(this);"
          enctype="multipart/form-data">
        <%--        <input type="hidden"/>--%>
        <div class="border border-secondary rounded p-3">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Họ và tên</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="fullName" required/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">E-mail</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" name="email" required/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Mật khẩu</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="password" required/>
                    <%--                    <input if="${user.id != null}" type="password" class="form-control" minlength="8" maxlength="64"--%>
                    <%--                           field="*{password}" placeholder="Để trống nếu bạn không muốn thay đổi mật khẩu"/>--%>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Trạng thái:</label>
                <div class="col-sm-8 mt-2">
                    <input type="checkbox" name="enabled"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Hình ảnh:</label>
                <div class="col-sm-8">
                    <%--                    <input type="hidden" field="*{photos}"/>--%>
                    <input type="file" id="fileImage" accept="image/png, image/jpeg" class="mb-2" name="photos"/>
                    <img id="thumbnail" src="../../images/image-thumbnail.png" alt="Photos preview" class="img-fluid"/>
                </div>
            </div>

            <div class="text-center">
                <input type="submit" value="Save" class="btn btn-primary m-3"/>
                <input type="button" value="Cancel" class="btn btn-secondary" onclick="javascript:history.back()">
            </div>
        </div>
    </form>

    <!-- modal -->
    <div replace="modal_fragments :: modal_dialog"></div>

    <!-- footer -->
    <jsp:include page="../footer.jsp"/>

</div>

<script type="text/javascript">
    moduleURL = "[[@{/users}]]";

    function checkEmailUnique(form) {
        url = "[[@{/users/check_email}]]";
        userEmail = $("#email").val(); // email of field, val() get the value of an input
        userId = $("#id").val();
        csrfValue = $("input[name='_csrf']").val();

        params = {id: userId, email: userEmail, _csrf: csrfValue}; // csrf token of spring security

        $.post(url, params, function (response) { // method post => url, data, callback
            if (response == "OK") {
                form.submit();
            } else if (response == "Duplicated") {
                showWarningModal("Email " + userEmail + " đã tồn tại !");
            } else {
                showErrorModal("Unknown response from server");
            }
        }).fail(function () {
            showErrorModal("Could not connect to the server"); // this line runs when the above url is wrong
        });

        return false;
    }
</script>
<script src="@{/js/common_form.js}"></script>
</body>
</html>
