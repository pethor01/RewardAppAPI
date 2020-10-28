module Types
    module Input
        class UserInput < Types::BaseInputObject
            argument :username, String, required: true
            argument :email, String, required: true
            argument :role, String, required: true
        end
    end
end