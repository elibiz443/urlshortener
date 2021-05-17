$(document).ready(function() {

  // VARIABLES
  var longUrl = $('.long-url');
  var alertError = $('.alert-error');

  var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
  var regex = new RegExp(expression);

  var errorMessage = 'Submit valid URL ⛔';
  var shorterForm = $('form.new_shortener');
  var shortURLInput = $('.short-url');

  // LAUNCH FUNCTION
  shorterForm.submit(function(e){
    if(longUrl.is(':invalid')){
    	console.log('invalid');
    }
    return validateUrl();
  })

  var validateUrl = function() {

    // INFOBOX CONDITIONS
    if((longUrl.val() === '') || (typeof(longUrl.val()) === 'undefined') || !(longUrl.val().match(regex))) {
      alertError.show();
      alertError.val(errorMessage);
      return false;

    } else {
      alertError.hide();
    }

  };

  // SELECT INPUT TEXT
  shortURLInput.select();

});
