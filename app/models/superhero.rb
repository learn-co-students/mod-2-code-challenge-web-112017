class Superhero < ApplicationRecord
  belongs_to :superpower
  accepts_nested_attributes_for :superpower

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

end
