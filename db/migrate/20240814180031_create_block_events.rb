class CreateBlockEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :block_events do |t|
      t.string :slack_id
      t.string :event_type
      t.references :user, null: false, foreign_key: true
      t.string :team_id

      t.timestamps
    end
  end
end
