class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.datetime :created_at
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
