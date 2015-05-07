class Pokemon < ActiveRecord::Base
  has_and_belongs_to_many :trainers
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
  validates :description, presence: true
  validates :catch_rate, presence: true, numericality: 
  { greater_than_or_equal_to: 3, less_than_or_equal_to: 255 }
  validates :run_rate { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :image { presence: true }
  validates :dexnum, presence: true, numericality: true
end

