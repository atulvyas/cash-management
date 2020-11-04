class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      companies_path
    elsif resource.is_a?(Teacher)
      new_teacher_user_session_path
    else
      super
    end
  end
end
