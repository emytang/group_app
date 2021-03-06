class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @group = Group.new
  end
  
  def users
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @members = @group.users
    @notmembers = User.not_in_group(@group)

    
  end

  def add_to_group
    @g = Group.find_by(id: params[:group_id])
    users = User.all
    mem = users.find_by(id: params[:id] )

    respond_to do |format|
      if mem.membership? @g
        format.html { redirect_to @g, notice: 'User is already in the Group.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      else
        @g.users << mem
        format.html { redirect_to @g, notice: 'User was successfully added.' }
        format.json { render :show, status: :created, location: @group }
      end
      # format.datetime :created_at, null: false
    end
  end

  def revoke_from_group
    mem = UserGroup.find_by(params[:id])
    g = Group.find_by(id: params[:group_id])
    mem.destroy
    puts g.inspect
    puts mem.inspect
    redirect_to group_path, notice: 'User was successfully destroyed in the group.'
  end
  
  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
        # format.datetime :created_at, null: false
      else
        format.js
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
      # format.datetime :created_at, null: false
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :email, :description)
    end
end
