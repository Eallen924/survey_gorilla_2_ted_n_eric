var messages = function(){

  // Remove old error list
  $('#errors').children("li").remove();

  // Check email validity
  if (!$('input[name="user[email]"]').val().match(/[\w-+]+@[\w-]+\.[.\w{2,}]+/)){
    $('#errors').append("<li>Invalid email bro</li>");
  } else {
    $('input[name="user[email]"]').css('border','4px solid green');
  }

  // Check for password errors
  var passwordErrors = 0
  var enteredPassword = $('input[name="user[entered_password]"]').val()
  var enteredPasswordConfirmation = $('input[name="user[entered_password_confirmation]"]').val()
  
  if (!enteredPassword.match(/\d/)){
    $('#errors').append("<li>Get at least 1 number up in that thing</li>");
    passwordErrors ++;
  }
  if (!enteredPassword.match(/[A-Z]/)){
    $('#errors').append("<li>CAPS. Use them.</li>");
    passwordErrors ++;
  }
  if (!enteredPassword.match(/.{8,}/)){
    $('#errors').append("<li>Your password is short, bro</li>");
    passwordErrors ++;
  }  
  var enteredPassword = $('input[name="user[entered_password]"]').val()
  var enteredPasswordConfirmation = $('input[name="user[entered_password_confirmation]"]').val()

  // if (!enteredPassword == enteredPasswordConfirmation) {
  //   $('#errors').append("<li>Your passwords don't match holmes.</li>");
  //   passwordErrors ++;
  // }

  if (passwordErrors == 0) {
    $('input[name="user[entered_password]"]').css('border','4px solid green');
    $('input[name="user[entered_password_confirmation]"]').css('border','4px solid green');
  }

  // Show disable button if any errors
  if($('#errors').html()==""){
    $('button').removeAttr('disabled');
  } else {
    $('button').attr('disabled','disabled');
  }

}

// Check errors on first load, and after every keyup
$(document).ready(function() {
  messages();
  $('#sign-up').on('keyup',messages);
});
