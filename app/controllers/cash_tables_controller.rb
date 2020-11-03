class CashTablesController < ApplicationController
  before_action :find_company


  def index
    @cashrecord = @company.cash_tables
  end

  def new
    @cashrecord = @company.cash_tables.new
  end

  def create
    @cashrecord = @company.cash_tables.new(require_params)
    if @cashrecord.save
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
    params.require(:cash_table).permit(:cash_out, :cash_in)
  end
end