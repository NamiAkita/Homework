class AddColumnDiaryDate < ActiveRecord::Migration[5.0]
  def change
    add_column :diaries, :day_of_diary, :date
  end
end
