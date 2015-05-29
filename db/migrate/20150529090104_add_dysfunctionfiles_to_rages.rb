class AddDysfunctionfilesToRages < ActiveRecord::Migration
  def change
    add_column :rages, :dysfunctionfiles, :json
  end
end
