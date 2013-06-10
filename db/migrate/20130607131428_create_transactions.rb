class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.datetime :date
      t.decimal :amount_spent, precision: 8, scale: 2, default: 0
      t.decimal :amount_saved, precision: 8, scale: 2, default: 0
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
