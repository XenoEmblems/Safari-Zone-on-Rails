class Pokemon < ActiveRecord::Base
  has_and_belongs_to_many :trainers
  validates :name, presence: true, uniqueness: true
  validates :poke_types, presence: true
  validates :catch_rate, presence: true, numericality: 
  { greater_than_or_equal_to: 3, less_than_or_equal_to: 255 }
end

