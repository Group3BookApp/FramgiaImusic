class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean
  end
end
