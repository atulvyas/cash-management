Rails.application.routes.draw do
 
  # student
  devise_for :users, path: 'students', controllers: { registrations: 'student/registrations', confirmations: 'confirmations'}
  resources :student 

  resources :companies do
    resources :cash_tables, only: [:new, :create, :index]
  end

  # teachers
  devise_for :users, path: 'teachers', controllers: { registrations: 'teacher/registrations', confirmations: 'confirmations'}, as: 'teacher'
  get 'dashboard', to: 'companies#dashboard'

  devise_scope :user do
    root to: "devise/sessions#new" 
  end

end
