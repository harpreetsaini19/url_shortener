class DeleteHitsColumnFromShorty < ActiveRecord::Migration
  def change
    remove_column :shorties, :hits
  end
end
