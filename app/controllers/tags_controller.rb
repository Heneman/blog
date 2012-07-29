class TagsController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.order('created_at desc').tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
  end
end