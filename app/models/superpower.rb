class Superpower < ApplicationRecord
  has_many :superheroes

  validates :superpower, uniqueness: true
  

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

end
