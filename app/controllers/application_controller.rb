class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user, :authenticate_action
  helper :all

  private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_action
    par_con = params[:controller]
    par_act = params[:action]
    ses_acts = ['new''destroy'] # available 'session' actions
    ses = ['sessions']
    con = ['entries','code','tag'] # available controllers #TODO - con << 'projects'
    act = ['index','show'] # available actions

    if con.include? par_con
      authenticate_user unless act.include? par_act
    elsif par_con == ses
      authenticate_user unless ses_act.include? par_act
    else
      authenticate_user
    end
  end

  def authenticate_user
    redirect_to :root unless current_user
  end
end