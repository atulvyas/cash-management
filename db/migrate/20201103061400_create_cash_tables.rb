class CreateCashTables < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_tables do |t|
      t.integer :cash_out
      t.integer :cash_in
      t.integer :total_cash
      t.integer :company_id
      t.timestamps
    end
  end
end
