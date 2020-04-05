class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :pdf
      t.string :audio
      t.string :youtube

      t.timestamps
    end
  end
end
