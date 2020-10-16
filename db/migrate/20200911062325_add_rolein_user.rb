class AddRoleinUser < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('admin', 'super_admin', 'customer');
      ALTER TABLE users ADD role user_role;
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE user_role;
    SQL
    remove_column :users, :role
  end

end
