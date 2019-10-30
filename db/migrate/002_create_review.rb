class CreateReview < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
    end
  end
  end
end
