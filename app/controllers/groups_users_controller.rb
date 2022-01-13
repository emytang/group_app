class GroupsUsersController < ApplicationController
  # before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    # @groups = Group.all
    @group = Group.find( params[:group_id])
    render plain: @group.name
  end
  
  
  
end