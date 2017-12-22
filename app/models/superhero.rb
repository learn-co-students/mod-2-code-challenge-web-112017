class Superhero < ApplicationRecord
  validates :super_name, uniqueness: true
  validates :super_name, :name, :superpower_id, presence: true
  belongs_to :superpower
end
