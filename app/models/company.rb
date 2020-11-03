class Company < ApplicationRecord
    belongs_to :student, foreign_key: 'user_id', class_name: "User"
    has_many :cash_tables, dependent: :destroy
end
