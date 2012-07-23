class CodeController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.tagged_with('code').order('created_at desc')
    @body_class = 'code'
  end
end