

require 'rails_helper'

RSpec.describe Mutations::CreateProfile, type: :request do
  describe '.resolve' do
    before(:all) do
        @user = create(:customer_user)
        barangay_list = ['Central Signal Village', 'South Signal Village', 'Lower Bicutan']
        # @username = Faker::Internet.username
        # @email = Faker::Internet.email
        # @role = "customer"

        @last_name = Faker::Name.last_name
        @first_name = Faker::Name.first_name
        @middle_name = Faker::Name.middle_name
        @store_name = Faker::Restaurant.name
        @contact_no = Faker::PhoneNumber.cell_phone_with_country_code

        @address = Faker::Address.street_address
        @barangay_name = barangay_list.sample
        @city_name = 'Taguig City'
    end

    it 'creates an user' do
      post '/graphql', params: { query: mutation(3, @last_name, @first_name, @middle_name, @store_name, @contact_no, @address, @barangay_name, @city_name) }
      json_response(response)
      # result = @data['user']
      # expect(@data['user']).to include(
      #   'id'           =>  be_present,
      #   'username'     =>  @username.to_s,
      #   'email'        =>  @email.to_s,
      # )
    end

    # it "will not save if the username is already exist" do
    #   user = create(:customer_user)
    #   post '/graphql', params: { query: mutation(user.username, user.email, user.role) }
    #   json_response(response)
    #   expect(@data).to eq nil
    # end
    
    def json_response(response)
      @json = JSON.parse(response.body)
      p @json
      @data = @json['data']['createProfile']
    end
    
    def mutation(user_id, last_name, first_name, middle_name, store_name, contact_no, address, barangay_name, city_name)
      <<~GQL
        mutation {
          createProfile(input: { profileParams: { userId: "#{user_id}", firstName: "#{first_name}", lastName: "#{last_name}", 
                                                    middleName: "#{middle_name}" , storeName: "#{store_name}"}}) {
            profile {
                id
                
                
            }
          }
        }
              
      GQL
      end
  end
end