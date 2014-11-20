class CreateShorties < ActiveRecord::Migration
  def change
    create_table :shorties do |t|
      t.string :shortened_url
      t.text :actual_url
      t.integer :http_status

      t.timestamps
    end

    add_index :shorties, :shortened_url
  end
end
