class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.integer :admin
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
