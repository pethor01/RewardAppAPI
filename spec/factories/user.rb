FactoryBot.define do
    factory :customer_user, class: "User" do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        role {"customer"}
    end

    factory :admin_user , class: "User" do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        role {"admin"}
    end

    factory :super_admin_user, class: "User" do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        role {"super_admin"}
    end

    factory :invalid_user, class: "User" do
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        role {"super_customer"}
    end
end