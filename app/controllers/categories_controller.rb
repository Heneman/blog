class CategoriesController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.order('created_at desc').where(:category => params[:category]).paginate(:page => params[:page], :per_page => 10)
  end
end