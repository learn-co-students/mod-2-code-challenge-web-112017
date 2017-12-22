class Superhero < ApplicationRecord
  has_one :superpower
  validates :superpower_id, uniqueness: true #to allow for only one superpower

  def self.search(search)
   where("superpower.description LIKE ?", "%#{search}%") 
 end

end
