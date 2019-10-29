class CreatePost.db < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
    end
  end
end
