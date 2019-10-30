class CreateHaunt < ActiveRecord::Migration[5.0]
  def change
    create_table :haunts do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :url
    end
  end
end
