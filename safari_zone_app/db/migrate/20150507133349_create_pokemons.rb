class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :catch_rate
      t.integer :run_rate
      t.text :image
      t.integer :dexnum
    end
  end
end
