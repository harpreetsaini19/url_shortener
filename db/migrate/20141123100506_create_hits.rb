class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.integer :shorty_id

      t.timestamps
    end
  end

  add_foreign_key('hits', 'shorties', column: 'shorty_id')

end
