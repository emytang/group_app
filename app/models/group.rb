class Group < ApplicationRecord
    before_save { self.email = email.downcase }
    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    has_many :user_groups, dependent: :destroy
    has_many :users, through: :user_groups
    attr_accessor :group_id
    validates_uniqueness_of :user
    
   
    
end
