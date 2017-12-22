class AddColumnSuperpowerIdToSuperheroes < ActiveRecord::Migration[5.0]
  def change
    add_reference :superheroes, :superpower, foreign_key: true
  end
end
