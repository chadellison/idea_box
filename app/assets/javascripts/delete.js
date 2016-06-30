$(document).ready(function(){
  function deleteIdea(id){
    $.ajax({
      type: "DELETE",
      url: "/api/v1/ideas/" + id + ".json",
      success: function(){
        $("#" + id).closest("div").fadeOut()
      }
    })
  }

  $("#ideas").on("click", ".delete", function(events){
    id = this.closest("div").id
    deleteIdea(id)
  });
})
