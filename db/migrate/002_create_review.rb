<<<<<<< HEAD
class CreateReview< ActiveRecord::Migration[5.0]
=======
class CreateReview < ActiveRecord::Migration[5.0]
>>>>>>> e5208ae814d037fbd125b192d801535f7ea0e726
  def change
    create_table :reviews do |t|
      t.belongs_to :haunt
      t.belongs_to :user
      t.integer :rating
      t.text :content
      t.datetime :date
    end
  end
end

#creating change to test