class Superpower < ApplicationRecord
  has_many :superheroes
  validates :name, presence: true
  validates :description, presence: true
end
