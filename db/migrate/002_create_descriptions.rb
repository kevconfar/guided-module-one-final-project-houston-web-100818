class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.belongs_to :haunt
      t.belongs_to :user
      t.text :content
    end
  end
end

