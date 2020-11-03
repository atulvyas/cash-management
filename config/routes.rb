Rails.application.routes.draw do
 
  # student
  devise_for :users, path: 'students', controllers: { registrations: 'student/registrations', confirmations: 'confirmations'}

  # teachers
  devise_for :users, path: 'teachers', controllers: { registrations: 'teacher/registrations', confirmations: 'confirmations'}, as: 'teacher'
  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
