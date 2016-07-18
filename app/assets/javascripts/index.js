var id = ''
var buttons = "<button class='delete'>" + 'Delete' + "</button>"
+ "<button class='thumbs down'>" + 'thumbs down' + "</button>"
+ "<button class='thumbs up'>" + 'thumbs up' + "</button>"

function renderIdeas(ideas) {
  $.each(ideas, function(index, idea){
    $('#ideas').append(
      "<div class='each-idea' id='" + idea.id + "'><div class='edit' contenteditable='true'><h3>"
      + idea.title + "</h3><p>"
      + idea.body + "</p><p></div>"
      + "<div class='quality'>" + 'Quality: ' + idea.quality + "</div>"
      + buttons
      + "</p></div>"
    )
  })
}

function fetchIdeas(){
  $.ajax({
    type: "GET",
    url: "/api/v1/ideas.json",
    success: function(ideas) {
      renderIdeas(ideas)
    },
  });
}

function removeIdeas(){
  $("#ideas").children().remove()
}

$(document).ready(function(){
  fetchIdeas()
})
