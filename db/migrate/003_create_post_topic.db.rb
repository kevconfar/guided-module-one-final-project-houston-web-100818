class CreatePostTopic.db < ActiveRecord::Migration[5.0]
  def change
    create_table :post_topics do |t|
      t.integer :post_id
      t.integer :topic_id
    end
  end
  end
end
