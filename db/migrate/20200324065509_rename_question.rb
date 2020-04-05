class RenameQuestion < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :student_id, :user_id
  end
end
