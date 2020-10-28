module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_profile, mutation: Mutations::CreateProfile
  end
end