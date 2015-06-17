class RemoveDysfunctionfilesFromRage < ActiveRecord::Migration
  def change
    remove_column :rages, :dysfunctionfiles, :json
  end
end
