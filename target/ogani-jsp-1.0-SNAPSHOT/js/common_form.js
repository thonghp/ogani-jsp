function showModalDialog(title, message) {
    $("#modalTitle").text(title);
    $("#modalBody").text(message);
    $("#modalDialog").modal();
}

function showWarningModal(message) {
    showModalDialog("Warning", message)
}