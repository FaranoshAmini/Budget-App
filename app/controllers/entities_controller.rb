class EntitiesController < ApplicationController
    def index
      @group = Group.find(params[:group_id])
      @entities = @group.entities.order(created_at: :desc)
      # @group_entities = Entity.where(group: @group)
    end
  
    def new
      @new_entity = Entity.new
      @group = Group.find(params[:group_id])
      @user_groups = Group.where(user: current_user)
    end
  
    def create
      # @group = Group.find(params[:group_id])
      # @entity = @group.entities.new(name: entity_params[:name],
      #   amount: entity_params[:amount], author_id: current_user.id)
      entity = Entity.create(name: entity_params[:name], author_id: current_user.id, amount: entity_params[:amount])
      return unless entity.save
  
      GroupEntity.create(entity_id: entity.id, group_id: params[:group])
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_entities_path
      # if @entity.save
      #   flash[:notice] = 'Transaction is completed'
      #   redirect_to group_entities_path(@group)
      # else
      #   flash[:notice] = 'Invalid Transaction!'
      # end
    end
  
    def destroy
      @transaction = Entity.find(params[:id])
  
      return unless @transaction.destroy
  
      flash[:success] = 'Transaction deleted successfully.'
      redirect_to group_entities_path(params[:group_id])
    end
  
    private
  
    def entity_params
      params.require(:entity).permit(:name, :amount, :author_id)
    end
  end