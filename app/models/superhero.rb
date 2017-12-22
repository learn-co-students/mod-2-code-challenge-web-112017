class Superhero < ApplicationRecord
  #has_one :superpower
  belongs_to :superpower
  validates :super_name, uniqueness: true

end
