class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :store_name, :contact_no, presence: true

  
end
