$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()



  $(".add_question").on('click', function(){
    $("this").closest(".question_board").append($("div.question"));
    console.log("here");
  });

  $(".add_choice").on('click', function(){
    $("this").closest(".choice_board").append($("div.choice"));
  });


});



