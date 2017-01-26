class RemoveIndexListsOnUrlFromLists < ActiveRecord::Migration[5.0]
  def change
  	  	remove_column :lists, :index_lists_on_url, :index
  end
end
