class Superpower < ApplicationRecord
  has_and_belongs_to_many :superheroes
end
