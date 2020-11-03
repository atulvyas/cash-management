Rails.application.routes.draw do
 
  # student
  devise_for :users, path: 'students', controllers: { registrations: 'student/registrations', confirmations: 'confirmations'}
  resources :student do
    resources :companies, only: [:new, :create, :edit, :update, :index], :controllers => "companies" do
      resources :cash_tables, only: [:new, :create]
    end
  end


  # teachers
  devise_for :users, path: 'teachers', controllers: { registrations: 'teacher/registrations', confirmations: 'confirmations'}, as: 'teacher'
  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
