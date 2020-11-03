class RemoveColumnFromCashTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :cash_tables, :cash_out
    remove_column :cash_tables, :cash_in
  end
end
