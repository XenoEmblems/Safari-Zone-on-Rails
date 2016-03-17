class PokemonSeeder

  def self.seed # Delegate #seed to a new instance
    new.seed
  end

  def initialize
    Pokemon.delete_all
  end

  def seed
    pokemon_json_data.each_with_index do |pokemon_from_json, index|
      dexnum = index + 1
      pokeapi_pokemon = fetch_pokemon(dexnum)

      Pokemon.create(
        name:        pokeapi_pokemon.name,
        dexnum:      dexnum,
        run_rate:    70,
        poke_types:  format_poke_types(pokeapi_pokemon),
        catch_rate:  pokemon_from_json["catchRate"],
        description: fetch_description_text(pokeapi_pokemon.descriptions),
        image:       "http://pokeapi.co/media/img/#{dexnum}.png"
      )
    end
  end

  private

  def format_poke_types(pokeapi_pokemon)
    pokeapi_pokemon.types.map { |d| d["name"].capitalize } * '/'
  end

  def fetch_description_text(description_data)
    id = description_data.first["resource_uri"].split('/').last
    description = Pokegem.get_obj("description", id)
    description.description
  end

  def fetch_pokemon(id)
    Pokegem.get_obj("pokemon", id)
  end

  def pokemon_json_data
    pokemon_json_file_location = Rails.root + 'db/pokemon.json'
    pokemon_json_file = File.read(pokemon_json_file_location)
    @pokemon_json_data ||= JSON.parse(pokemon_json_file)['pokemon']
  end
end
