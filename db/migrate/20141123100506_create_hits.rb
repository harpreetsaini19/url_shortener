class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.integer :shorty_id
      t.foreign_key :shorties, column: 'shorty_id'

      t.timestamps
    end
  end
end
