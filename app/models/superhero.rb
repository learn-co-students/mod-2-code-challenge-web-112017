class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, presence: true, uniqueness: true

  def self.search(search)
    superpower = Superpower.find_by(name: search)
    @superheroes = Superhero.where(superpower: superpower)
  end


end
