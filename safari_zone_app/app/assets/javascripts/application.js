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

  $('#safari').on("click", getRandomPokemon)
};

$(document).ready(init);
$(document).on('page:load', init);

var safariLoad = function() {
  console.log("POKEMON");
};

var getRandomPokemon = function () {
  var id = Math.floor(Math.random() * 718) + 1
  $.ajax({
    url: "/pokemons/:id",
    data: {id: id},
    method: "GET",
    dataType: "json"
  }).done(renderOne);
}

var renderOne = function (data) {
  var safariDiv = $("#safari");
  safariDiv.empty();
  var pokeTemplate = Handlebars.compile($("#pokeShow-template").html())
  var pokemonData = {
    img: data.img_url
  }
  showDiv.append(pokeTemplate(pokemonData));
  showDiv.show();
}
// $.ajax