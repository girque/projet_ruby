class AddUserIdToRage < ActiveRecord::Migration
  def change
    add_column :rages, :user_id, :integer
  end
end
