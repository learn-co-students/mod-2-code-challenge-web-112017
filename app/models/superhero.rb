class Superhero < ApplicationRecord
  has_one :superpower

  # def superpower
  #   Superpower.find(self.superpower_id)
  # end
end
