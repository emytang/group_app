class AddUserIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :user_id, :interger
    add_index :groups, :user_id
  end
end
