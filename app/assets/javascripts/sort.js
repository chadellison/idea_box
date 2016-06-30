function sortByQuality(divs){
  var swill = []
  var plausible = []
  var genius = []

  $.each(divs, function(index, div){
    if($(div).children(".quality").text() === "Quality: swill"){
      swill.push(div)
    } else if($(div).children(".quality").text() === "Quality: plausible"){
      plausible.push(div)
    } else if($(div).children(".quality").text() === "Quality: genius"){
      genius.push(div)
    }
  })
  return swill.concat(plausible).concat(genius)
}

$(document).ready(function(){
  $("#sort").on("click", function(){
    $("#sort").toggleClass("desc")

    var divs = $("#ideas").children("div")
    var sorted = sortByQuality(divs)
    if($("#sort").hasClass("desc")){
      sorted = sorted.reverse()
    }
    removeIdeas()
    $("#ideas").append(sorted)
  })
})
