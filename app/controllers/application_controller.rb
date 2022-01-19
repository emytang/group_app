class ApplicationController < ActionController::Base

 def revoke_from_group
    mem = UserGroup.find_by(params[:id]) 
    mem.destroy
   #  respond_to do |format|
   #    format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
   #    format.json { head :no_content }
   #  end
 end
  
end