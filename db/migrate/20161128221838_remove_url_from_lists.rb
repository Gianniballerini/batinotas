class RemoveUrlFromLists < ActiveRecord::Migration[5.0]
  def change
  	remove_column :lists, :url, :string
  end
end
