class User < ApplicationRecord
  has_one :profile
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :jwt_authenticatable, jwt_revocation_strategy: self
          
          
  enum role: { admin: 'admin', super_admin: 'super_admin', customer: 'customer' }
  validates :role, inclusion: { in: roles.keys }
  validates :username, uniqueness: true
  validates :username, presence: true

  before_create :generate_temporary_password


  def generate_temporary_password
    temp_pass = SecureRandom.base36(8)
    self.password = temp_pass.upcase 
    self.temp_password = temp_pass.upcase 
  end

  def password_required?
    false
  end
  

end
