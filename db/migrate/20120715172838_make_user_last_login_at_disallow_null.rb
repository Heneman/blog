class MakeUserLastLoginAtDisallowNull < ActiveRecord::Migration
  def change
    remove_column :users, :last_login_at
  end
end
