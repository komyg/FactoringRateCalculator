class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.column :title_value, :decimal, precision: 15, scale: 3
      t.column :term, :integer
      t.column :monthly_revenue, :decimal, precision: 15, scale: 3
      t.column :receivable_value, :decimal, precision: 15, scale: 3

      t.timestamps
    end
  end
end
