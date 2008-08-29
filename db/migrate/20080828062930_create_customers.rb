class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :company
      t.string :contact
      t.string :address
      t.string :email
      t.string :bucket

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
