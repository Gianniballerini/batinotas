class AddUrlToLists < ActiveRecord::Migration[5.0]
  def change
  	add_index :lists, :url, unique: true
  end
end
