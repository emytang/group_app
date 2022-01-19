class Group < ApplicationRecord
    validates_presence_of :name, :email
    validates_uniqueness_of :name, :email
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    has_many :groups_users
    has_many :users, :through => :groups_users
    # has_one :groups_users, dependent: :destroy  #through: "groups_users"
    has_many :user_groups, dependent: :destroy
    has_many :users, through: :user_groups
    
    def has_user_member?(user)
    users.exists?(user)
    end
    
    attr_accessor :group_id
    
    # def get_users_not_in_shop_group
    #     UserGroup.not_in_group(group_id)
    # end
    
    # scope :not_in_group, -> group_id {User.joins(:user_groups).where.not(group_id: @group.id)}
    # scope :not_in_group, -> group_id {joins('LEFT JOIN user_groups ON user_groups.user_id = users.id').where("user_groups.group_id != ? OR user_groups.group_id is null", group_id)}

    
end
