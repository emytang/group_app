class ApplicationController < ActionController::Base
 #  respond_to :html, :json
 #  include ActionController::MimeResponds

 def revoke_from_group
    g = Group.find_by(params[:group_id])
    mem = UserGroup.find_by(params[:id]) 
    mem.destroy
    redirect_to g, notice: 'User was successfully destroyed in the group.'

 end
  
end