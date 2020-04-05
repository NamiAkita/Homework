class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :student_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
