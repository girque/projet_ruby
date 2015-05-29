class AddUserIdToDysfunction < ActiveRecord::Migration
  def change
    add_column :dysfunctions, :user_id, :integer
  end
end
