class CodeController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.order('created_at desc').where(:category => 'code').paginate(:page => params[:page], :per_page => 10)
  end
end