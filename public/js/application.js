$(document).ready(function () {
  var qId = 0
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });


  $('#add-question').click(function(event) {
    event.preventDefault();
    $.post('/add_question', function(newQuestionData) {
      $('newQuestionData').find()
      $('#extra-questions').append(newQuestionData);
    })
  })
});
