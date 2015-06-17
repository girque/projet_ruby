class CreateMyrages < ActiveRecord::Migration
  def change
    create_table :myrages do |t|

      t.timestamps null: false
    end
  end
end
