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
    # @usersall = User.all
    # @notmembers = User.not_in_group(Group.find(params[:id]))
    # @notmembers = Group.find(params[:id]).get_users_not_in_shop_group
    # @notmembers = User.where("user_groups.group_id != ? OR user_groups.group_id is null", @group.id)
    # @notmembers = UserGroup.where.not(group_id: @group.id) #not error but wrong 
    # @notmembers = User.joins(:user_groups).where.not(group_id: @group.id)
    @notmembers = User.not_in_group(@group)
        # scope :not_in_group, -> group_id {joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id != ? OR user_groups.group_id is null", group_id)}

    
  end

  # def revoke_from_group
  #   mem = UserGroup.find_by(params[:id]) 
  #   mem.destroy
  #   respond_to do |format|
  #     format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  
  
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
