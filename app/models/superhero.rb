class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true

def self.search(search)
  if @superpower = Superpower.find_by(name: search)
  where("superpower_id LIKE ?", @superpower.id)
else
end
end

end
