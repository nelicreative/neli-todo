class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :section, null: false, foreign_key: true
      t.integer :slack_message_id
      t.string :title
      t.text :content
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
