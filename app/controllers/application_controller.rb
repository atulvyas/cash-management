class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      student_companies_path(student_id: resource.id)
    elsif resource.is_a?(Teacher)
      new_teacher_user_session_path
    else
      super
    end
  end
end
