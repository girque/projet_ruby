class AddStateToRages < ActiveRecord::Migration
  def change
    add_column :rages, :state, :string
  end
end
