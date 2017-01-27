class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :list, foreign_key: true
      t.string :type
      t.string :state
      t.string :description
      t.integer :priority
      t.datetime :valid_from
      t.datetime :valid_until
      t.float :percentage

      t.timestamps
    end
  end
end
