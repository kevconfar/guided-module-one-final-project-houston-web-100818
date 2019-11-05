class CreateHauntDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :haunt_descriptions do |t|
      t.integer :haunt_id
      t.integer :description_id
    end
  end
end
