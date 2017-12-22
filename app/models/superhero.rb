class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true

  def self.search(search)
    where("super_name LIKE ?", "%#{search}%")
  end

end
