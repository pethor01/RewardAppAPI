module Types
    class Role < GraphQL::Schema::Enum
        value('customer', 'customer number one')
        value('admin', 'admin number one')
        value('super_admin', 'super_admin number one')
    end
  end