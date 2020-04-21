class RenameColDialyVideo < ActiveRecord::Migration[5.0]
  def change
    rename_column :diaries, :videos, :video
  end
end
