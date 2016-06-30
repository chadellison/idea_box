$(document).ready(function(){
  function addIdea(idea){
    $.ajax({
      type: "POST",
      url: "/api/v1/ideas.json",
      data: {idea: idea},
      success: function(idea){
        createIdea(idea)
      }
    })
  }

  $("#submit").on("click", function(){
    var title = $("#title").val()
    var body  = $("#body").val()
    var idea  = { title: title, body: body }
    addIdea(idea)
  })

  function createIdea(idea){
    $("#ideas").prepend(
      "<div class='each-idea' id='" + idea.id + "'><div class='edit' contenteditable='true'><h3>"
      + idea.title + "</h3><p>"
      + idea.body + "</p><p></div>"
      + "<div class='quality'>" + 'Quality: ' + idea.quality + "</div>"
      + buttons
      + "</p></div>"
    )
    $("input.idea").val(null)
  }
})
