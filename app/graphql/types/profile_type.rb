module Types
  class ProfileType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :last_name, String, null: true
    field :first_name, String, null: true
    field :middle_name, String, null: true
    field :store_name, String, null: true
    field :contact_no, String, null: true
    field :address, String, null: true
    field :barangay_name, String, null: true
    field :city_name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
