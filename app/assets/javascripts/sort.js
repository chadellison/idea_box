function sortByQuality(divs){
  var swill = []
  var plausible = []
  var genius = []

  for (var i = 0; i < divs.length; i++){

    if($(divs[i]).children(".quality").text() === "Quality: swill"){
      swill.push(divs[i])
    } else if($(divs[i]).children(".quality").text() === "Quality: plausible"){
      plausible.push(divs[i])
    } else if($(divs[i]).children(".quality").text() === "Quality: genius"){
      genius.push(divs[i])
    }
  }
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
