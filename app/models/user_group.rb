class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  # scope :not_in_group, -> group_id {joins("left join user_groups on users.id = user_groups.user_id").where('user_groups.group_id != ?', group_id)}
  
  # scope :not_in_group, ->(group) {includes(:user_groups).where('user_groups.group_id != ?', group_id)}

  # scope :not_in_group, ->(group) {joins(:user_groups).where('user_groups.group_id != ?', group_id)}

  # scope :not_in_group, -> group_id {joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id != ? OR user_groups.group_id is null", group_id)}
  
  def self.not_in_group(groupid)
      includes(:user_groups).where("user_groups.group_id != ?", groupid)
  end
  
end
