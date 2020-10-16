require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  describe '.resolve' do
    before(:all) do
      @username = Faker::Internet.username
      @email = Faker::Internet.email
      @role = "customer"
    end

    it 'creates an user' do
      post '/graphql', params: { query: mutation(@username, @email, @role) }
      json_response(response)
      result = @data['user']
      expect(@data['user']).to include(
        'id'           =>  be_present,
        'username'     =>  @username.to_s,
        'email'        =>  @email.to_s,
      )
    end

    it "will not save if the username is already exist" do
      user = create(:customer_user)
      post '/graphql', params: { query: mutation(user.username, user.email, user.role) }
      json_response(response)
      expect(@data).to eq nil
    end
    
    def json_response(response)
      @json = JSON.parse(response.body)
      p @json
      @data = @json['data']['createUser']
    end
    
    def mutation(username, email, role)
        <<~GQL
          mutation {
            createUser(input: {
              username: "#{username}",
              email: "#{email}",
              role: "#{role}"
            }) {
              user {
                id
                username
                email
                jti
                tempPassword
                role
              }
            }
          }
        GQL
      end
  end
end