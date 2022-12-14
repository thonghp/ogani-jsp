<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý thể loại - OGANI Admin</title>
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

    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<div class="container-fluid">

    <!-- navigation -->
    <jsp:include page="header.jsp"/>

    <div class="m-3 text-center">
        <h2>Quản Lý Thể Loại</h2>
    </div>

    <!-- search -->
    <div>
        <form action="" class="form-inline m-3">
            <input type="hidden" name="sortField"/>
            <input type="hidden" name="sortType"/>

            <a href="user_form.jsp" class="fas fa-user-plus fa-2x icon-dark mr-2"></a>
            &nbsp;&nbsp;
            <a href="" class="fas fa-file-csv fa-2x mr-2" style="color: #007c01"></a>
            &nbsp;&nbsp;
            <a href="" class="fas fa-file-excel fa-2x mr-2" style="color: #1e6b3f"></a>
            &nbsp;&nbsp;
            <a href="" class="fas fa-file-pdf fa-2x" style="color: #db0001"></a>
            &nbsp;&nbsp;

            Tìm Kiếm: &nbsp;
            <input type="search" name="keyword" class="form-control" required
                   placeholder="Tìm kiếm thể loại mong muốn" size="60%"/>
            &nbsp;&nbsp;
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i>
            </button>
            &nbsp;&nbsp;
            <button type="button" class="btn btn-secondary" onclick="clearFilter()" title="Xoá">
                <i class="fas fa-eraser"></i>
            </button>
        </form>

        <c:if test="${message != null}">
            <div class="alert alert-success text-center" id="hideMessage">${message}</div>
        </c:if>
    </div>

    <!-- table -->
    <div class="full-details">
        <table class="table table-bordered table-striped table-hover table-responsive-xl">
            <thead class="thead-dark">
            <tr>
                <th>Id</th>
                <th>Tên thể loại</th>
                <th>Alias</th>
                <th>Trạng thái</th>
                <th></th>
            </tr>
            </thead>

            <!-- load user list -->
            <tbody>
<%--            <c:forEach var="user" items="${listUsers}">--%>
                <tr>
                    <td>1</td>
                    <td>Sách tham khảo</td>
                    <td>Sách-tham-khảo</td>
                    <td>
<%--                        <c:if test="${user.enabled == true}">--%>
                            <a class="fas fa-check-circle fa-2x icon-green" title="Đang hoạt động"></a>
<%--                        </c:if>--%>
                        <c:if test="${user.enabled == false}">
                            <a class="fas fa-check-circle fa-2x icon-dark" title="Bị vô hiệu hóa"></a>
                        </c:if>
                    </td>
                    <td>
                        <a class="fas fa-edit fa-2x icon-green" href="edit_user?id=${user.userId}"
                           title="Chỉnh sửa"></a>
                        <a class="fas fa-trash fa-2x icon-dark link-delete" href="delete_user?id=${user.userId}"
                           title="Xoá" entityId="${user.userId}"></a>
                    </td>
                </tr>
<%--            </c:forEach>--%>
            </tbody>
        </table>
    </div>

    <!-- responsive table -->
    <div class="less-details">
        <c:forEach var="user" items="${listUsers}">
            <div class="row m-1">
                <div class="col-4">
                    <span class="fas fa-portrait fa-3x icon-silver"></span>
                </div>
                <div class="col-8">
                    <td>${user.email}</td>
                    <td>${user.fullName}</td>
                    <div>
                        <c:if test="${user.enabled == true}">
                            <a class="fas fa-check-circle fa-2x icon-green" title="Đang hoạt động"></a>
                        </c:if>
                        <c:if test="${user.enabled == false}">
                            <a class="fas fa-check-circle fa-2x icon-dark" title="Bị vô hiệu hóa"></a>
                        </c:if>
                        &nbsp;
                        <a class="fas fa-edit fa-2x icon-green" href="edit_user?id=${user.userId}"
                           title="Chỉnh sửa"></a>
                        &nbsp;
                        <a class="fas fa-trash fa-2x icon-dark"
                           href="javascript:confirmDelete(${user.userId})"
                           title="Xoá"></a>
                    </div>
                </div>
                <div>&nbsp;</div>
            </div>
        </c:forEach>
    </div>

    <jsp:include page="confirm_modal.jsp"/>

    <%-- pagination --%>
    <jsp:include page="pagination.jsp"/>

    <!-- footer -->
    <jsp:include page="footer.jsp"/>

</div>

<script type="text/javascript">
    function clearFilter() {
        window.location = 'list_users';
    }

    const message = document.getElementById('hideMessage');

    if (message !== null) {
        function hideMessage() {
            message.style.display = 'none';
        }

        setTimeout(hideMessage, 5000);
    }

    function showDeleteConfirmModal(link) {
        entityId = link.attr("entityId");

        $("#yesButton").attr("href", link.attr("href")); // set value of attribute
        $("#confirmText").text("Bạn có muốn xoá nhân viên có id là " + entityId + " không ?");
        $("#confirmModal").modal();
    }

    $(document).ready(function () {
        $(".link-delete").on("click", function (e) {
            e.preventDefault();
            showDeleteConfirmModal($(this));
        });
    });
</script>
</body>
</html>
