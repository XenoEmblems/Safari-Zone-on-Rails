class Trainer < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :pokemons
  validates :username, presence: true, uniqueness: true
  validates :safari_balls, presence: true, 
  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
end
