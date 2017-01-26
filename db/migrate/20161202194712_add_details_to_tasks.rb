class AddDetailsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :percentage, :float
  end
end
