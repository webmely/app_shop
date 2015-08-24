class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    #Add user to table
    User.create! do |u|
        u.email     = 'admin@admin.com'
        u.password    = 'adminadmin'
        u.role = 'admin'
    end
  end
end
