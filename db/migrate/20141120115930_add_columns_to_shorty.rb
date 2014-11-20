class AddColumnsToShorty < ActiveRecord::Migration
  def change
    add_column :shorties, :alias, :string
    add_column :shorties, :hits, :integer, :default => 0
  end
end
