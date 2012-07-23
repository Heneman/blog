require 'bcrypt'

class UsersController < ApplicationController
  def new
    if current_user
      @user = User.new
    else
      redirect_to :root
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :root
    else
      render "new"
    end
  end
end