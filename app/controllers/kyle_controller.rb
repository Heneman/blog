class KyleController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.tagged_with('kyle').order('created_at desc')
    @body_class = 'kyle'
  end
end