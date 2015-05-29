class CreateDysfunctions < ActiveRecord::Migration
  def change
    create_table :dysfunctions do |t|
      t.string :picture

      t.timestamps null: false
    end
  end
end
