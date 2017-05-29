class AddRateToRequest < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :rate, foreign_key: true
  end
end
