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
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require social-share-button
//= require init
//= require Chart.bundle
//= require chartkick
//= require_tree .



Chartkick.configure({language: "es", mapsApiKey: "..."})





// jquery para inicializar funciones de materializae
$(document).ready(function(){
  $('.tabs').tabs();
});

  $(document).ready(function(){
    $('.sidenav').sidenav();
  });
  $(document).ready(function(){
    $('.modal').modal();
  });
  $(document).ready(function(){
  $('.timepicker').timepicker();
});
$(document).ready(function(){
   $('.collapsible').collapsible();
 });

  $(document).ready(function(){
     $('.datepicker').datepicker();
   });
  $(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();

  });
  $(document).ready(function(){
  $('.tooltipped').tooltip();
});

  $(document).ready(function(){
    $('select').formSelect();
  });

$(document).ready(function(){
  $('.parallax').parallax();
});
$(document).ready(function(){
  $('.dropdown-trigger').dropdown();
});

$(document).ready(function(){
$('.chips').chips();
$('.chips-initial').chips({
  data: [{
    tag: 'Apple',
  }, {
    tag: 'Microsoft',
  }, {
    tag: 'Google',
  }],
});
$('.chips-placeholder').chips({
  placeholder: 'Enter a tag',
  secondaryPlaceholder: '+Tag',
});
$('.chips-autocomplete').chips({
  autocompleteOptions: {
    data: {
      'Apple': null,
      'Microsoft': null,
      'Google': null
    },
    limit: Infinity,
    minLength: 1
  }
});

});




$(document).ready(function() {
$('input#input_text, textarea#textarea2').characterCounter();
});

$(document).ready(function() {
    setTimeout(function() {
		// Declaramos la capa mediante una clase para ocultarlo
        $(".midiv").fadeOut(1500);
    },4000);
});

$(document).ready(function() {
	setTimeout(function() {
		// Declaramos la capa  mediante una clase para ocultarlo
        $(".midiv2").fadeIn(1500);
		// Transcurridos 5 segundos aparecera la capa midiv2
  },7000);
});
