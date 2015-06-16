class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :rage_id
      t.boolean :isAuthor

      t.timestamps null: false
    end
  end
end
