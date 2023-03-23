class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_group
  before_action :set_expense, only: %i[show edit update destroy]

  def index; end

def new
  @groups = Group.where(user_id: current_user.id).includes(:expenses)
  expense = Expense.new
  expense.group_ids = @group.id
  respond_to do |format|
    format.html { render :new, locals: { expense: } }
  end
end


  def create
    new_expense = Expense.new(expense_params)
    new_expense.user_id = current_user.id
    respond_to do |format|
      format.html do
        if new_expense.save
          flash[:notice] = 'Transaction saved successfully'
          redirect_to group_path(new_expense.group_ids)
        else
          flash.now[:alert] = 'Error: transaction could not be saved'
          render :new, locals: { expense: }
        end
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

def set_expense
  @expense = Expense.includes(:groups).find(params[:id])
end


  def expense_params
    params.require(:new_expense).permit(:name, :amount, group_ids: [])
  end
end
