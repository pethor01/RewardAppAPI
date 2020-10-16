class Mutations::CreateUser < Mutations::BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true
    argument :role, String, required: true


    field :user, Types::UserType, null: false
    # field :errors, [String], null: true 

    def resolve(args)
        user = User.new(args)
        if user.save
            {
                user: user
            }
        else
            GraphQL::ExecutionError.new("Invalid input: #{user.errors.full_messages.join(', ')}")
        end
    end

end