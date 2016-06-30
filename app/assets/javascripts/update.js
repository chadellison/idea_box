$(document).ready(function(){
  function updateIdea(id, amount){
    $.ajax({
      type: "PATCH",
      data: { quality: amount },
      url: "/api/v1/ideas/" + id + ".json",
      success: function(){
        $.ajax({
          type: "GET",
          url: "/api/v1/ideas/" + id + ".json",
          success: function(idea) {
            var quality = idea.quality
            $("#" + id).children("div").last().text("Quality: " + quality)
          }
        })
      }
    })
  }

  $("#ideas").on("click", ".thumbs", function(){
    id = this.closest("div").id

    if($(this).hasClass("up")) {
      var amount = 1
    } else {
      var amount = -1
    }
    updateIdea(id, amount)
  })
})
