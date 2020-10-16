require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before(:all) do
      @user = build(:customer_user)
    end 

    context "enums and values" do
      it { should define_enum_for(:role).
        with_values(
          admin: 'admin',
          super_admin: 'super_admin',
          customer: 'customer'
        ).backed_by_column_of_type(:enum) }
      it { should allow_values(:admin, :super_admin, :customer).for(:role) }
    end

    context "validations" do
      before { @user1 = build(:customer_user) }
  
      context "presence" do
        it { should validate_presence_of :username }
        it { should validate_presence_of :email }
      end
  
      context "uniqueness" do
        it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
        it { should validate_uniqueness_of :username }
      end
    end
      
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not save when username is not unique' do
      user = User.create(username: @user.username, password: @user.password, role: "customer")
      expect(user).to be_invalid
    end

  end

  describe "when user is created" do
    before(:all) do
      @user = build(:customer_user)
    end  
    it "creates a JWT token before saving if one does not exist" do
      expect(@user.jti).to be_blank
      @user.save
      expect(@user.reload.jti).to_not be_blank
    end
  end
end
