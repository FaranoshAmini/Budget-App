class GroupsController < ApplicationController
  # before_action :require_login
  def index
    # @groups = Group.where(author_id: current_user)
    # @groups = Group.all.order(created_at: :desc).includes(:entities)
    if user_signed_in?
      @groups = Group.all.order(created_at: :desc).includes(:entities).where(author: current_user)
    else
      @page_title = 'Home'
      redirect_to home_path
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      flash[:notice] = 'Category created successfully'
      redirect_to groups_path
    else
      puts @group.errors
      puts @group.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    return unless @group.destroy

    flash[:success] = 'Category deleted successfully.'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
