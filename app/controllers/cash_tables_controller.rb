class CashTablesController < ApplicationController
  before_action :find_company


  def index
    @cashtable = @company.cash_tables
  end

  def new
    @cashtable = @company.cash_tables.new
  end

  def create
    @cashtable = @company.cash_tables.new(require_params)
    if @cashtable.save
      redirect_to company_cash_tables_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @company.update(require_params)
      render 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to student_companies_path
  end

  private
  def find_company
    @company = current_user.companies.find(params[:company_id])
  end

  def require_params
    params[:cash_table][:cashrecord] = params[:cash_table][:cashrecord].to_i 
    params.require(:cash_table).permit(:cashrecord, :amount)
  end
end