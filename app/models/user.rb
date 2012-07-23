class User < ActiveRecord::Base
  has_many :code_entries
  has_many :food_entries
  has_many :inclusive_entries

  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation, :last_login_at
  before_save :encrypt_password, :add_datetime

  validates_presence_of :email, :password, :on => :create
  validates_uniqueness_of :email
  validates_confirmation_of :password

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def add_datetime
    self.last_login_at = Time.now
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end