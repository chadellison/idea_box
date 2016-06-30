$(document).ready(function(){
  function filterQuality(quality){
    $.ajax({
      type: "GET",
      data: {quality: quality},
      url: "/api/v1/qualities.json",
      success: function(ideas){
        removeIdeas()
        renderIdeas(ideas)
      }
    })
  }

  $("#genius").on("click", function(){
    filterQuality("2")
  })

  $("#plausible").on("click", function(){
    filterQuality("1")
  })

  $("#swill").on("click", function(){
    filterQuality("0")
  })

  $("#all").on("click", function(){
    removeIdeas()
    fetchIdeas()
  })
})
