class ChangeColumnTypeInCashtable < ActiveRecord::Migration[6.0]
  def change
    change_column :cash_tables, :total_cash, :float
  end
end
