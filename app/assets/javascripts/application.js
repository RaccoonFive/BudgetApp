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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

////
// Open sidemenu
$(document).on('click', '.navbar__sideMenuButton', (event) => {
  if ($('.sideBar').hasClass('active')) {
    $('.sideBar').removeClass('active');
  } else {
    $('.sideBar').addClass('active');
  }
});

////
// Close sidemenu
$(document).on('click', (event) => {
  if (!$(event.target).closest('.sideBar').length && !$(event.target).is($('#sideBarBtn'))) {
    $('.sideBar').removeClass('active');
  }
});

toastr.options = {
  "closeButton": false,
  "debug": false,
  "positionClass": "toast-top-right",
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}