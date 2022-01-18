class UsersGroupsController < ApplicationController
  # before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    # @groups = Group.all
    @group = Group.find( params[:group_id])
    render plain: @group.name
  end
  
  def create
    @group = Group.find( params[:group_id])
    @group.users << User.find(params[:id])
  end
  
  def new
    @group = Group.find( params[:group_id])
    # @group = Group.new
    
  end
  
  def show
  end
  
  def find
    render @group.find(@group.users.id = 77)
  end
  
end