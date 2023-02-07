class UpdateColumnStyle < ActiveRecord::Migration[6.1]
  def change 
    change_table :events do |t|
      t.rename :style, :dance_style
    end
  end
end
