// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require foundation
//= require_tree .

$(document).on('click', '.movie-button', function(){
  var movieId = $(this).attr('id').split('-')[1]
  console.log($('#movie-comment-'+ movieId).attr('class'));
  if ($('#movie-comment-'+ movieId).attr('class') == "hide") {
    $('#movie-comment-'+ movieId).addClass('animated fadeIn');
    $('#movie-comment-'+ movieId).removeClass('hide');
  } else {
    $('#movie-comment-'+ movieId).removeClass('animated fadeIn');
    $('#movie-comment-'+ movieId).addClass('hide');
  }
});
