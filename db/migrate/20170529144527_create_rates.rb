class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.column :rate, :decimal, precision: 8, scale: 5
      t.column :days, :integer
      t.column :monthy_revenue, :decimal, precision: 15, scale: 3
      t.column :default_rate, :boolean

      t.timestamps
    end
  end
end
