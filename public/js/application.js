$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()



  $(".add_question").on('click', function(e){
    e.preventDefault();
    $("#question_board").append($.trim($("#new_question").html()));
  });


  $('#question_board').on('keyup', '.choice_input', function () {
   if(!($(this).val() === '')){
      $(this).next(".add_choice").css("display","inline");
    } else {
      $(this).next(".add_choice").css("display","none");
   }
 });


  $("#question_board").on('click', '.add_choice', function(e){
    e.preventDefault();
    $(this).closest(".choice_board").append($.trim($("#new_choice").html()));
  });

  $("#question_board").on('click', '.remove_choice', function(e){
    e.preventDefault();
    $(this).closest(".choice").remove();
    console.log($(this).closest(".choice"));
  });


});



