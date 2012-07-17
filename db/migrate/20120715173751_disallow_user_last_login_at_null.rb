class DisallowUserLastLoginAtNull < ActiveRecord::Migration
  def change
    add_column :users, :last_login_at, :datetime, :null => false
  end
end
