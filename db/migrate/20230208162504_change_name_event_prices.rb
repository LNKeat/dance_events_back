class ChangeNameEventPrices < ActiveRecord::Migration[6.1]
  def change
    change_table :events do |t|
      t.rename :prices, :price
    end
  end
end
