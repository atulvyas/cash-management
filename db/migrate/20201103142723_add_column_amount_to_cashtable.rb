class AddColumnAmountToCashtable < ActiveRecord::Migration[6.0]
  def change
    add_column :cash_tables, :amount, :float
  end
end
