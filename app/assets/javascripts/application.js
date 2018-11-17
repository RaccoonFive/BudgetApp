// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require Chart.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

////
// Open sidemenu

$(document).ready(function (event) {
  $('.navbar__sideMenuButton').click(function (event) {
    if ($('.sideBar').hasClass('active')) {
      $('.sideBar').removeClass('active');
    } else {
      $('.sideBar').addClass('active');
    }
  });
});


////
// Close sidemenu
$(document).click(function (event) {
  if (!$(event.target).closest('.sideBar').length && !$(event.target).is($('#sideBarBtn'))) {
    $('.sideBar').removeClass('active');
  }
});