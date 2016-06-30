$(document).ready(function(){
  function editIdea(id, title, body){
    $.ajax({
      type: "PATCH",
      url: "/api/v1/ideas/" + id + ".json",
      data: { idea: { title: title, body: body }},
      success: function(){

      },
      error: function(errorBody){
        alert('error');
      }
    })
  }

  $("#ideas").on("blur", ".edit", function(){
    var id = $(this).parent().attr("id")
    var title = $(this).children("h3").text()
    var body = $(this).children("p").text()
    editIdea(id, title, body)
  })
})
