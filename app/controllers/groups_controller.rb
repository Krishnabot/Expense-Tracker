class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.groups
  end

def show
  @category = Group.includes(:expenses).find(params[:id])
  @expenses = @category.expenses.order(created_at: :desc)
end


  def new
    categorie = Group.new
    respond_to do |format|
      format.html { render :new, locals: { categorie: } }
    end
  end

  def create
    new_categorie = Group.new(params.require(:new_categorie).permit(:name, :icon))
    new_categorie.user_id = current_user.id
    respond_to do |format|
      format.html do
        if new_categorie.save
          flash[:notice] = 'Success: Categorie saved successfully'
          redirect_to groups_path
        else
          flash.now[:alert] = 'Fail: Categorie could not be saved'
          render :new, locals: { categorie: }
        end
      end
    end
  end
end
