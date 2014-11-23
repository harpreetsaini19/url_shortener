class AddBookmarkColumnToShorty < ActiveRecord::Migration
  def change
    add_column :shorties, :bookmark, :boolean, :default => 0
  end
end
