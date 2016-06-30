$(document).ready(function(){
  function updateIdea(id, amount){
    $.ajax({
      type: "PATCH",
      data: { quality: amount },
      url: "/api/v1/ideas/" + id + ".json",
      success: newQuality(id, amount),
      error: function(errorBody){
        alert('error');
      }
    })
  }

  function newQuality(id, amount) {
    var oldQuality = $("#" + id).children("div").last()
    if(amount === 1) {
      increment(oldQuality)
    } else {
      decrement(oldQuality)
    }
  }

  function increment(quality){
    if(quality.text() === "Quality: swill") {
      quality.text("Quality: plausible")
    } else {
      quality.text("Quality: genius")
    }
  }

  function decrement(quality){
    if(quality.text() === "Quality: genius") {
      quality.text("Quality: plausible")
    } else {
      quality.text("Quality: swill")
    }
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
