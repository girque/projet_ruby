class CreateProofAttachments < ActiveRecord::Migration
  def change
    create_table :proof_attachments do |t|
      t.integer :rage_id
      t.string :path

      t.timestamps null: false
    end
  end
end
