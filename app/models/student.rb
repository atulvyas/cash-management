class Student < User
    has_many :companies, dependent: :destroy, foreign_key: 'user_id'
end