<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <c:if test="${title != null}"><title>${title}</title></c:if>
    <c:if test="${title == null}"><title>Thêm thể loại</title></c:if>

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

    <!-- user form -->
    <div class="m-3 text-center">
        <c:if test="${title != null}"><h2>${title}</h2></c:if>
        <c:if test="${title == null}"><h2>Thêm Thể Loại</h2></c:if>
    </div>
    <!-- user form -->

    <c:if test="${user.userId != null}">
    <form action="update_user" method="post" style="max-width: 700px; margin: 0 auto">
        <input type="hidden" name="userId" value="${user.userId}">
        </c:if>

        <c:if test="${user.userId == null}">
        <form action="create_user" method="post" style="max-width: 700px; margin: 0 auto">
            </c:if>

            <div class="border border-secondary rounded p-3">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Tên thể loại</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="fullName" value="${user.fullName}" required/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">Alias</label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control" name="email" value="${user.email}" required/>
                    </div>
                </div>

                <input type="hidden" name="roleId" value="2"/>

                <div class="form-group row">
                    <label class="col-sm-4 col-form-label mt-1">Trạng thái:</label>
                    <div class="col-sm-8 mt-3">
                        <c:if test="${user.enabled == true|| user == null}">
                            <input type="checkbox" name="enabled" checked/>
                        </c:if>
                        <c:if test="${user.enabled == false}">
                            <input type="checkbox" name="enabled"/>
                        </c:if>
                    </div>
                </div>

                <div class="text-center">
                    <input type="submit" value="Save" class="btn btn-primary m-3"/>
                    <input type="button" value="Cancel" class="btn btn-secondary" id="btnCancel">
                </div>
            </div>
        </form>

        <jsp:include page="modal_dialog.jsp"/>

        <!-- footer -->
        <jsp:include page="footer.jsp"/>

</div>

<script type="text/javascript">
    function showModalDialog(title, message) {
        $("#modalTitle").text(title);
        $("#modalBody").text(message);
        $("#modalDialog").modal();
    }

    const message = "${message}";
    if (message !== "") {
        showModalDialog("Warning", message)
    }

    $(document).ready(function () {
        $("#btnCancel").on("click", function () {
            window.location = "list_categories";
        });
    });
</script>

</body>
</html>
