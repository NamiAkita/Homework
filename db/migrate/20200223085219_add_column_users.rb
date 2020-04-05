class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_viet, :string
    add_column :users, :last_name_viet, :string
    add_column :users, :image, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :incharge, :string
    add_column :users, :status, :string
    
  end
end
