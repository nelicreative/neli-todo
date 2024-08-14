class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :workspace, null: false, foreign_key: true
      t.string :name
      t.string :slack_channel
      t.integer :is_private
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
