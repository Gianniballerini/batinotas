class AddUrlUniqToLists < ActiveRecord::Migration[5.0]
  def change
  	add_column :lists, :url, :string
    add_index :lists, :url, unique: true
  end
end
