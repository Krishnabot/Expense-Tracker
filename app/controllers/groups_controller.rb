class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @categories = current_user.groups.includes(:expenses)
  end

  def show
    @category = Group.includes(:expenses).find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc).includes(:groups)
  end

  def new
    @categorie = Group.new
  end

  def create
    @categorie = Group.new(group_params)
    @categorie.user = current_user
    if @categorie.save
      flash[:notice] = 'Success: Category saved successfully'
      redirect_to groups_path
    else
      flash.now[:alert] = 'Fail: Category could not be saved'
      render :new
    end
  end

  private

  def group_params
    params.require(:new_categorie).permit(:name, :icon)
  end
end
