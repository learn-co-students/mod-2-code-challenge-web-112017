class Superhero < ApplicationRecord
  validates :super_name, uniqueness: true

  belongs_to :superpower

  def self.search(q)
    if !q.to_s.empty?
      self.all.select {|hero| hero.superpower.name == q.downcase}
    else
      self.all
    end
  end
end
