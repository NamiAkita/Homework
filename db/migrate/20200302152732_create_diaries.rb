class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :images
      t.string :videos

      t.timestamps
    end
  end
end
