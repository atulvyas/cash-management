class CompaniesController < ApplicationController
  
  def new
  end

  def index
    student = Student.find_by(id: params[:student_id])
    @company = student.companies
  end

end