module Types
    module Input
        class ProfileInput < Types::BaseInputObject

            argument :user_id, ID, required: false
            argument :last_name, String, required: false
            argument :first_name, String , required: false
            argument :middle_name, String, required: false
            argument :store_name, String, required: false
            argument :contact_no, String, required: false
            argument :address, String, required: false
            argument :barangay_name, String, required: false
            argument :city_name, String, required: false
        end
    end
end
