class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.column :name, :string
      t.column :email, :string
      t.timestamps
    end

    add_index :customers, :email, unique: true
  end
end
