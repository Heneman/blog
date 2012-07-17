class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user

  private 

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenticate_action
      if params[:controller] == "entries"
        if params[:action ] == "index" || params[:action] == "show"
          # Do nothing
        else
          authenticate_user
        end
      elsif params[:controller] == "sessions" && params[:action] == "new"
         # Do nothing
      else
        authenticate_user
      end
    end

    def authenticate_user
      if !current_user
        redirect_to :root
      end
    end
end
