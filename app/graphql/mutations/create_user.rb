class Mutations::CreateUser < Mutations::BaseMutation
    argument :input_user, Types::Input::UserInput, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: true 

    def resolve(input_user: )
        user_params = Hash input_user
        user = User.new(user_params)
        if user.save
            {
                user: user
            }
        else
            GraphQL::ExecutionError.new("Invalid input: #{user.errors.full_messages.join(', ')}")
        end
    end

end