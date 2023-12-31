class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @new_entity = Entity.new
    @group = Group.find(params[:group_id])
    @user_groups = Group.where(author: current_user)
  end

  def create
    entity = Entity.new(name: entity_params[:name], author_id: current_user.id, amount: entity_params[:amount])

    if entity.save
      groups = Group.find(params[:group_id])
      GroupEntity.create(entity_id: entity.id, group_id: groups.id)
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_entities_path
    else
      flash[:error] = 'Failed to create transaction'
      render :new
    end
  end

  def destroy
    @transaction = Entity.find(params[:id])

    return unless @transaction.destroy

    flash[:success] = 'Transaction deleted successfully.'
    redirect_to group_entities_path(params[:group_id])
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :author_id, :group_id)
  end
end
