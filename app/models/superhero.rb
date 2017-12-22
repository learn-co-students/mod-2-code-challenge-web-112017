class Superhero < ApplicationRecord
  belongs_to :superpower

  def hero_power
    self.superpower
  end
end
