class Trainer < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :pokemons
  validates :username, presence: true, uniqueness: true
  validates :safari_balls, presence: true, 
  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  def add_pokemon(pokemon)
    self.pokemons.push(pokemon) unless self.pokemons.include? pokemon
  end

  def remove_pokemon(pokemon)
    self.pokemons.destroy(pokemon) if self.pokemons.include? pokemon
  end
end