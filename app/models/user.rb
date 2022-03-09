class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  has_many :groups_users 
  has_many :groups, :through => :groups_users
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups


  def self.not_in_group(group)
    user_ids = group.users.map(&:id)
    self.where.not(id: user_ids)
  end

  def membership?(group)
    user_groups.find_by(group: group).present?
  end

end
