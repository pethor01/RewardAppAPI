FactoryBot.define do
  factory :customer_profile , class: "Profile"do
    user { create(:customer_user) }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    store_name { Faker::Commerce.department(max: 2, fixed_amount: true)}
    contact_no { Faker::Name.middle_name }
    middle_name { Faker::Name.middle_name }
  end
end
