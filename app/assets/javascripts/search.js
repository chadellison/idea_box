$(document).ready(function(){
  function filterByText(text){
    $.ajax({
      type: "GET",
      url: "/api/v1/ideas.json",
      data: { text: text },
      success: function(ideas){
        removeIdeas()
        renderIdeas(ideas)
      }
    })
  }

  $("#search").keyup(function() {
    var text = $(this).val()
    filterByText(text)
  });
})
