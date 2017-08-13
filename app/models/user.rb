class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  belongs_to :role

  after_create :assign_role_to_user

  def admin?
    self.role.name == "admin"
  end
  def host?
  self.role.name == "host"
  end
  def guest?
    self.role.name == "guest"
  end

  def assign_role_to_user
    role = Role.last
    self.role_id = role.id
    self.save
  end
end
