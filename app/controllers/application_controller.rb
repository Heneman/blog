class ApplicationController < ActionController::Base
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TextHelper

  protect_from_forgery
  helper_method :current_user, :authenticate_action
  helper :all

  private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_action
    if params[:controller] == 'entries'
      authenticate_user unless params[:action] == 'index' || params[:action] == 'show' || params[:action] == 'code' || params[:action] == 'food'  || params[:action] == 'kyle'
    elsif params[:controller] == 'sessions'
      authenticate_user unless params[:action] == 'new' || params[:action] == 'destroy'
    else
      authenticate_user
    end
  end

  def authenticate_user
    redirect_to :root unless current_user
  end
end