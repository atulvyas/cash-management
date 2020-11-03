class CompaniesController < ApplicationController
  
  def new
  end

  def index
    @companies = current_user.companies
  end

end
