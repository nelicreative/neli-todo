class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :workspace, null: false, foreign_key: true
      t.integer :assigner_id
      t.integer :user_id
      t.string :multipriority
      t.string :title
      t.string :description
      t.string :multitag, array: true, default: []
      t.datetime :time_start
      t.datetime :time_end
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
