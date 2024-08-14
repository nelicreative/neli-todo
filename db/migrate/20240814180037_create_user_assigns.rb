class CreateUserAssigns < ActiveRecord::Migration[7.0]
  def change
    create_table :user_assigns do |t|
      t.references :task, null: false, foreign_key: true
      t.string :slack_id
      t.string :slack_user_id
      t.integer :assigner_id
      t.datetime :deadline_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
