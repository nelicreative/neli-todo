class CreateBlockChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :block_channels do |t|
      t.string :slack_channel_id
      t.string :slack_team_id
      t.references :user, null: false, foreign_key: true
      t.text :message_text
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
