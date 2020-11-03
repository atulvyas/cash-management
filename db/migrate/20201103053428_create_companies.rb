class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.float :initial_cash, :default => 0.0
      t.float :current_cash, :default => 0.0
      t.timestamps
    end
  end
end
