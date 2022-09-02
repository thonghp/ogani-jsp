<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <jsp:include page="../header.jsp"/>

    <div class="mb-5">
        <h2>Quản lý thể loại | [[${pageTitle}]]</h2>
    </div>

    <form action="@{/categories/save}" method="post" style="max-wid 700px; margin: 0 auto"
          onsubmit="return checkUnique(this);" object="${category}" enctype="multipart/form-data">
        <input type="hidden" field="*{id}"/>

        <div class="border border-secondary rounded p-3">
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Tên thể loại:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" required minlength="3" maxlength="128" field="*{name}"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Alias</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" minlength="3" maxlength="64" field="*{alias}"
                           placeholder="Mặc định khoảng cách được thay thế bằng dấu -"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Thể loại cha</label>
                <div class="col-sm-8">
                    <select field="*{parent}" class="form-control">
                        <option value="0">[Root]</option>

                        <block each="cat: ${listCategories}">
                            <option value="${cat.id}">[[${cat.name}]]</option>
                        </block>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Hình ảnh:</label>
                <div class="col-sm-8">
                    <input type="hidden" field="*{image}"/>
                    <input type="file" id="fileImage" accept="image/png, image/jpeg" class="mb-2" name="fileImage"/>
                    <div class="mt-2">
                        <img id="thumbnail" alt="Image preview" class="img-fluid" src="@{${category.imagePath}}"/>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label">Enabled:</label>
                <div class="col-sm-8 mt-2">
                    <input type="checkbox" field="*{enabled}"/>
                </div>
            </div>
            <div class="text-center">
                <input type="submit" value="Save" class="btn btn-primary m-3"/>
                <input type="button" value="Cancel" class="btn btn-secondary" id="btnCancel">
            </div>
        </div>
    </form>

    <div replace="modal_fragments :: modal_dialog"></div>

    <!-- footer -->
    <div replace="fragments :: footer"></div>

</div>

<script type="text/javascript">
    moduleURL = "[[@{/categories}]]";

    function checkUnique(form) {
        url = "[[@{/categories/check_unique}]]";

        catAlias = $("#alias").val();
        catName = $("#name").val();
        catId = $("#id").val();

        csrfValue = $("input[name='_csrf']").val();

        params = {id: catId, name: catName, alias: catAlias, _csrf: csrfValue};

        $.post(url, params, function (response) {
            if (response == "OK") {
                form.submit();
            } else if (response == "DuplicateName") {
                showWarningModal("Tên thể loại " + catName + " đã tồn tại !");
            } else if (response == "DuplicateAlias") {
                showWarningModal("Tên Alias " + catAlias + " đã tồn tại !");
            } else {
                showErrorModal("Unknown response from server");
            }
        }).fail(function () {
            showErrorModal("Could not connect to the server");
        });

        return false;
    }
</script>
<script src="@{/js/common_form.js}"></script>
</body>
</html>
