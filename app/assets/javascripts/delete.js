$(document).ready(function() {
  $(".remove").on("click", function() {
    $(this).closest("div").fadeOut()
  });
});
