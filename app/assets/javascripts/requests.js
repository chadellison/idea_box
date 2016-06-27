$(document).ready(function() {
  $(".new-idea").on("ajax:success", function() {
    $("form").trigger("reset");
  }).on("ajax:error", function() {
    // $(".new-idea").append "<p>ERROR</p>"
  });
});
