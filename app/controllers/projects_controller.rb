# TODO -
# class ProjectsController < ApplicationController
#   before_filter :authenticate_action

#   def index
#     @entries = Entry.order('created_at desc').where(:category => 'projects').paginate(:page => params[:page], :per_page => 10)
#   end
# end