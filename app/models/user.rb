class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  validates_presence_of :username,:first_name,:last_name,:number
  validates_uniqueness_of :username,:first_name,:last_name

  belongs_to :role
  has_many :bookings
  has_many :rooms
  has_many :amenities
  after_create :assign_role_to_user

  def role?(role)
    self.role.name == role
  end

  def assign_role_to_user
      role = Role.find_by(name: "guest").id
      self.role_id = role
      self.save
  end
end
