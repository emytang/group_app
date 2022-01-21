class User < ApplicationRecord
  # belongs_to :group
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  has_many :groups_users 
  has_many :groups, :through => :groups_users
  # 
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  
  
  
  def self.not_in_group(group)
    joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id != ? OR user_groups.group_id is null", group.id)
  end
  
end
