$(document).ready(function() {
  $('#submit').click(function(e) {
    if ($('legend').length > $("[type='radio']:checked").length)
    {
      // window.alert("You must answer all the questions to submit final answers.");
      e.preventDefault();
      $('hr').append('<div class="alert alert-danger" id="alert">You must answer every question before submitting</div>')
    }
  })
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


	// if you can help it, don't make statemachines
	// this whole 'edit a boolean and check it later' model
	// breaks pretty quickly. Try refactorying this into methods

	/*

		a start in this direction would be to split updateCounter into two methods.
		one that updates the counter, and another that checks if the counter is over max value

		updateCounter($obj, max, min){
			changeDomToReflectCharCount()
			if(isValid($obj, max, min)
				colorItRed
		}

		once you have that, you can create methods

		var isValid = function($obj, max, min){
			//most of the logic that is currently in updateCounter
			return whether or not it is valid
		}

		then you don't need the variables:
			titleValid,
			descriptionValid,
			questionValid,
			choiceValid

		****TLDR****
		- keep accessors and mutators separate
		- if a function is both, split it into two
		- avoid state

	*/

  var titleValid = false
  var descriptionValid = false
  var questionValid = false
  var choiceValid = false

  $('#title').on('keyup', function(){
    titleValid = updateCounter($(this), 25, 0);
    updateSubmit();
  });

  $('#description').on('keyup', function(){
    descriptionValid = updateCounter($(this), 250, 10)
    updateSubmit();
  });

  $('#question_board').on('keyup', '.question_field', function(){
    questionValid = updateCounter($(this), 250, 0)
    updateSubmit();
  });

  $('#question_board').on('keyup', '.choice_input', function(){
    console.log($(this))
    choiceValid = updateCounter($(this), 10000, 0)
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

  $(document).on('click', '#doasurvey', function(e){
    e.preventDefault();
    url = $('#takesurvey').val();
    window.location.href = url;
  })

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
		// instead of checking boolean values and hope they were set
		// we can present the same information functions titleValid(), descriptionValid(), etc..
    if (titleValid && descriptionValid && questionValid && choiceValid) {
      $('#submit').removeAttr("disabled");
    }
    else {
      $('#submit').attr("disabled", "disabled");
    }
  }

});

