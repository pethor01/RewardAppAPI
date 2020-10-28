class Mutations::CreateProfile < Mutations::BaseMutation

    argument :profile_params, Types::Input::ProfileInput, required: true

    field :profile, Types::ProfileType, null: false

    def resolve(profile_params: )
        p "hahahah"
        p profile_params.user_id
        user = User.find_by(id: profile_params.user_id)
        
        result = {
            profile: nil
        }
        if user
            create_profile = user.build_profile(profile_params.to_h)
            if create_profile.save
                {
                    profile: create_profile 
                }
            else
                GraphQL::ExecutionError.new("Invalid input: #{create_profile.errors.full_messages.join(', ')}")
            end
        else
            GraphQL::ExecutionError.new("Invalid User")
        end
        # if user.save
        #     profile = Profile.create_user_profile(  user.id, profile_params.first_name, profile_params.last_name, profile_params.middle_name,
        #                                             profile_params.store_name,  profile_params.contact_no, 
        #                                             profile_params.address, profile_params.barangay_name, profile_params.city_name )
        #     result[:user] = user
        #     result[:profile] =  profile
        #     find_user_profile = Profile.find_by(user_id: user.id)
        #     p "wowowowoow"
        #     p result[:user]
        #     if find_user_profile.nil?
        #         result[:user] = nil
        #         result[:profile] =  nil
        #         GraphQL::ExecutionError.new("Invalid input: #{profile.join(', ')}")
        #     end
                
        # end

    end
end