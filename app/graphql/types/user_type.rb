module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :jti, String, null: false
    field :temp_password, String, null: false
    field :role, Role, null: false
  end
end
