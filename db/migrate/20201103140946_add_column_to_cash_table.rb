class AddColumnToCashTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cash_tables, :cashrecord, :integer
  end
end
