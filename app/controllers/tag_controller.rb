class TagController < ApplicationController
  before_filter :authenticate_action

  def index
    debugger
    @entries = Entry.tagged_with(params[:format]).paginate(:page => params[:page], :per_page => 10)
  end
end