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

// Onload for only the Safari Div
// Ajax call for the pokemon database
// Click event for an Ajax call to put the pokemon to the trainer.
console.log("is this loading?");

var init = function() {
  console.log('about to set up click event');
  getRandomPokemon();
};
$(function(){
$('#run').on('click', runAway);
$('#safari_ball').on('click', catchPokemon);
$('#rock').on('click', throwRock);
$('#bait').on('click', throwBait);
  
})



$(document).ready(init);
$(document).on('page:load', init);



var getRandomPokemon = function () {
  var id = Math.floor(Math.random() * 718) + 1
  $.ajax({
    url: "/safari_zone/" + id,
    method: "GET",
    dataType: "json",
    success: function(data) {
      renderSafari(data)
    } 
  })
}

var renderSafari = function(data) {
  $('.safari').attr('data-id', data.id).html(
    '<h2>A wild ' + data.name + ' has appeared!!</h2>' +
    '<img src="' + data.image + '"height="300" width="300">'
    // '<p> Catch Rate: ' + data.catch_rate +' </p>' +
    // '<p> Run Rate: ' + data.run_rate +' </p>'
  )
  var currentName = this.name
}

var runAway = function() {
  getRandomPokemon();
  $('.events').html(
    '<h2>You have ran away!</h2>'
  )
}

var catchPokemon = function() {
  var id = parseInt($(".safari").attr('data-id'));
  $.ajax({
    url: "/trainers/" +  id + "/add_pokemon",
    method: "PUT",
    dataType: "json"
  }).done(getRandomPokemon())
  $('.events').html(
    '<h2>This Pokemon has been caught and sent to your Profile!!</h2>'
  )
}

var throwRock = function(data) {
  $('.events').html(
    '<h2>You thrown a rock at the Pokemon and is now furious!</h2>'
  )
}

var throwBait = function(data) {
  $('.events').html(
    '<h2>You thrown bait towards the Pokemon and is now eatingx!</h2>'
  )
}




// var renderOne = function (data) {
//   var safariDiv = $("#safari");
//   safariDiv.empty();
//   var pokeTemplate = Handlebars.compile($("#pokeShow-template").html())
//   var pokemonData = {
//     img: data.img_url
//   }
//   showDiv.append(pokeTemplate(pokemonData));
//   showDiv.show();
// }
// $.ajax