class CashTable < ApplicationRecord
    belongs_to :company
    enum cashrecord: [:cash_out, :cash_in]
end
