class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:username]
  belongs_to :roles

  after_create :assign_role_to_user

  def assign_role_to_user
    role = Role.last
    self.role_id = role.id
    self.save
  end
end
