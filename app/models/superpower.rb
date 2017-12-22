class Superpower < ApplicationRecord
  has_many :superheroes

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end


end
