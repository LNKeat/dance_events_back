class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :style
      t.boolean :is_affordable
      t.date :start
      t.integer :location_id
    end
  end
end
