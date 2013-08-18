$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var titleValid = false
  var descriptionValid = false


  $('#title').on('keyup', function(){
    titleValid = updateCounter($(this), 25, 0);
    updateSubmit();
  });

  $('#description').on('keyup', function(){
    descriptionValid = updateCounter($(this), 250, 10)
    updateSubmit();
  });

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


  function updateCounter(selector, max, min){
    var charCount = selector.val().length;
    var charCountLeft = max-charCount
    var $text_counter = selector.next(".text_counter")
    $text_counter.text(charCountLeft);

    if (charCountLeft < 0 || charCount < min) {
      $text_counter.css('color', 'red')
    }
    else {
      $text_counter.css('color', 'black')
    }

    if (charCount > min && charCount < max) {
      return true
    }
    else {
      return false
    }
  };


  function updateSubmit(){
    console.log(titleValid)
    console.log(descriptionValid)
    if (titleValid && descriptionValid) {
      $('#submit').removeAttr("disabled");
    }
    else {
      $('#submit').attr("disabled", "disabled");
    }
  }
});




