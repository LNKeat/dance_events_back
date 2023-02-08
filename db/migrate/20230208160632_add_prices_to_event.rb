class AddPricesToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column(:events, :prices, :integer) 
  end
end
