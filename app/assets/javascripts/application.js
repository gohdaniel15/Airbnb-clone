// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('.sign-in').click(function() {
    // $('.jumbotron').fadeOut('fast');
    $('.sign-up-container').fadeOut('fast');
    $('.sign-in-container').fadeIn('slow');
    $('.navbar-collapse').removeClass('collapse in');
    $('.navbar-collapse').addClass('collapse');
  });

  $('.sign-up').click(function() {
    // $('.jumbotron').fadeOut('fast');
    $('.sign-in-container').fadeOut('fast');
    $('.sign-up-container').fadeIn('slow');
    $('.navbar-collapse').removeClass('collapse in');
    $('.navbar-collapse').addClass('collapse');
  });

  $('.home').click(function() {
    // $('.jumbotron').fadeIn('fast');
    $('.sign-in-container').fadeOut('slow');
    $('.sign-up-container').fadeOut('slow');
    $('.navbar-collapse').removeClass('collapse in');
    $('.navbar-collapse').addClass('collapse');
  });

  // $('.container').click(function() {
  //   $('.navbar-collapse').removeClass('collapse in');
  //   $('.navbar-collapse').addClass('collapsing');
  // });
});
