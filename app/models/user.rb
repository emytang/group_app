class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  has_many :groups_users 
  has_many :groups, :through => :groups_users
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  # validates_uniqueness_of :id
  
  #
  def self.not_in_group(group)
    joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id != ? OR user_groups.group_id is null", group.id)
  end

  # def self.not_in_group(group)
  #   ug = UserGroup.all
  #   if ug.find_by(group: group).present?
  #     joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id is null", group.id)
  #   end
  # end

  # def self.not_in_group(group)
  #   t = joins('LEFT JOIN user_groups ON user_groups.user_id = users.id')
  #   if  user_groups.find_by(group: group).present?
  #     if user_groups.group_id != group.id
  #       return true
  #     else
  #       return false
  #     end
  #   else
  #     return false
  #   end
  # end

  def membership?(group)
    user_groups.find_by(group: group).present?
  end

end
