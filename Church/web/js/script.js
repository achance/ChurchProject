$(document).ready(function() {
    // tool tip
    $('.normaltip').aToolTip({
        toolTipClass: 'aToolTip'});

})
function submitContact() {
    var name = $("#name").val(), email = $("#email").val(), web = $("#web").val(), mess = $("#mess").val();

    if (name.trim() == "" || email.trim() == "" || web.trim() == "" || mess.trim() == "") {
        alert("You must enter all information!!");
    } else {
        $("#ContactForm").submit();
    }
}

function resetContact() {
    var form = $("#ContactForm");
    form.reset();
}
