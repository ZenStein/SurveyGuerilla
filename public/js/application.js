$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
var max_fields = 50; // Max input boxes allowed
var questions_wrapper = $(".question_fields_wrap"); //Fields wrapper
var add_question_button = $(".add_question_button"); //Add question button ID
var add_answer_button = $(".add_answer_button");

console.log("DOCUMENT READY!")
var x = 1;
$(add_question_button).click(function(e){
	console.log("ADD QUESTION BUTTON PUSHED!")
	e.preventDefault();
	if(x < max_fields){
		x++;
		$(questions_wrapper).append('<div class="question'+ x +'"><label for="question">Question:</label><input type="text" name="questions[]"/><a href="#" class="remove_question_field">Remove Question</a><div class="answers_wrap"><div><label for="answer">Choice:</label><input type="text" name="answer[question'+x+'][]"/></div><div><label for="answer">Choice:</label><input type="text" name="answer[question'+x+'][]"/></div><div><label for="answer">Choice:</label><input type="text" name="answer[question'+x+'][]"/></div><div><button class="add_answer_button">Add More Choices</button></div></div>');
		add_answer_button = $(".add_answer_button");
		console.log(add_answer_button);
	}
});

$(add_answer_button).on("click",function(e){
	console.log("ADD ANSWER BUTTON PUSHED!")	
	
	e.preventDefault();
	if(x < max_fields){
		x++;
		console.log($(this).parent().parent().parent())
		var answers_wrapper = $(this).parent().parent().find(".answers_wrap")
		console.log(answers_wrapper)
		var question_number = $(this).parent().parent().attr('class')
		$(answers_wrapper).append('<div class="additional_answers"><label for="answer">Choice:</label><input type="text" name="answer['+ question_number+'][]"/><a href="#" class="remove_answer_field">Remove Choice</a></div>');
	}
});

$(questions_wrapper).on("click",".remove_question_field", function(e){
	e.preventDefault(); $(this).parent('div').remove(); x--;
});

$(".answers_wrap").on("click",".remove_answer_field", function(e){
	e.preventDefault(); $(this).parent('div').remove(); x--;
});

});
