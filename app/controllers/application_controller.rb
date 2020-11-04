class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Student)
      companies_path
    elsif resource.is_a?(Teacher)
      dashboard_path
    else
      super
    end
  end
end
