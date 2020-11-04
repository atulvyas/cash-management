class CashTablesController < ApplicationController
  before_action :find_company
  def index
    @cashtable = @company.cash_tables.order('created_at DESC')
  end

  def new
    @cashtable = @company.cash_tables.new
  end

  def create
    if require_params
      @cashtable = @company.cash_tables.new(require_params)
      if update_current_amount
        @cashtable.total_cash = @company.current_cash
        if @cashtable.save
          flash.alert = "Amount updated successfully"
          redirect_to company_cash_tables_path
        else
          render 'new'
        end
      else
        flash.alert = "Please enter the valid amount"
        redirect_to company_cash_tables_path
      end
    else
      @cashtable = @company.cash_tables.new
      flash.alert = "Please enter correct amount"
      render 'new'
    end
  end

  def edit
  end

  private
  def find_company
    @company = current_user.companies.find(params[:company_id])
  end

  def require_params
    params[:cash_table][:cashrecord] = params[:cash_table][:cashrecord].to_i 
    if validate_amount(params[:cash_table][:amount])
      params[:cash_table][:amount] = params[:cash_table][:amount].to_f
      params.require(:cash_table).permit(:cashrecord, :amount)
    else
      return false
    end
  end

  def update_current_amount
    current_amount = @company.current_cash
    if params[:cash_table][:cashrecord] == 1 
      if params[:cash_table][:amount] > 0
        @company.update(current_cash: current_amount + params[:cash_table][:amount])
      else
        return false
      end
    else
      if current_amount >= params[:cash_table][:amount]
        @company.update(current_cash: current_amount - params[:cash_table][:amount])
      else
        return false
      end
    end
  end

  def validate_amount(amount)
    number = Float( amount ) rescue nil
      if number.nil? 
        return false
      else
        return true
      end
  end
end