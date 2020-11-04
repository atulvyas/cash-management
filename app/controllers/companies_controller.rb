class CompaniesController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def new
    @company = current_user.companies.new
  end

  def index
    @companies = current_user.companies
  end

  def create
    @company = current_user.companies.new(require_params)
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @company.update(require_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  # for teacher
  def dashboard
  end

  private
  def find_user
    @company = current_user.companies.find(params[:id])
  end

  def require_params
    params.require(:company).permit(:name, :country)
  end
end

