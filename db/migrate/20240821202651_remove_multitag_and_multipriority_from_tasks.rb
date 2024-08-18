class RemoveMultitagAndMultipriorityFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :multitag, :string
    remove_column :tasks, :multipriority, :integer
  end
end
