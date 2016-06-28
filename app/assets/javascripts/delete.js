$(document).ready(function() {
  $("#ideas").on("click", ".remove", function(events) {
    $(this).closest("div").fadeOut()
  });
});
