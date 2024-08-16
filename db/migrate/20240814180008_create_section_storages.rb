class CreateSectionStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :section_storages do |t|
      t.references :section, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :image
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
