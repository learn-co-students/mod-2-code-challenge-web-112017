class CreateSuperheroes < ActiveRecord::Migration[5.0]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.string :super_name
      t.belongs_to :superpower

      t.timestamps
    end
  end
end
