class CreateHaunts < ActiveRecord::Migration[5.0]
  def change
    create_table :haunts do |t|
      t.string :name
      t.string :location
      t.string :description
      #t.boolean :haunted_accomodation
    end
  end
end