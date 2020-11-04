class CashTable < ApplicationRecord
	belongs_to :company
	enum cashrecord: [:cash_out, :cash_in]
	validates :amount, :cashrecord , presence: true
  validates_numericality_of :amount, :greater_than_or_equal_to => 1
	validate :check_amount
	after_create :update_company_cash

	def check_amount
		if cashrecord == "cash_out"
			self.errors.add(:amount, "amount should be less than company's current amount, current available amount is - #{company.current_cash}") if company.current_cash < amount
		end
	end

	def update_company_cash
		current_cash = cashrecord == "cash_in" ? (company.current_cash + amount) : (company.current_cash - amount)
		company.update(current_cash: current_cash)
		self.update(total_cash: current_cash)
	end
end
