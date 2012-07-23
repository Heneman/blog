class FoodController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.tagged_with('food').order('created_at desc')
    @body_class = 'food'
  end
end