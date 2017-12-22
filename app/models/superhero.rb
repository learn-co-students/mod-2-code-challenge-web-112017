class Superhero < ApplicationRecord
  belongs_to :superpower


  # def self.search(search)
  #   where("superpower LIKE ?", "%#{search}%")
  # end
end
