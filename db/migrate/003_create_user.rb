class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :haunt_id
      t.integer :review_id
    end
  end
end
