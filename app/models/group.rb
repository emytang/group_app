class Group < ApplicationRecord
    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    has_many :users, through: "groups_users"
    has_many :groups_users
end
