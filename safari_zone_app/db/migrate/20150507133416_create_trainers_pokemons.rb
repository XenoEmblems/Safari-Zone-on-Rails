class CreateTrainersPokemons < ActiveRecord::Migration
  def change
    create_join_table :trainers, :pokemons
  end
end
