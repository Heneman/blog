class EntriesController < ApplicationController
  before_filter :authenticate_action

  def index
    @entries = Entry.order("created_at desc")
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find_by_id(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      redirect_to entries_path
    else
      render "new"
    end
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
  end

  def update
    @entry = Entry.find_by_id(params[:id])

    if @entry.update_attributes(params[:entry])
      redirect_to entries_path
    else
      render "edit"
    end
  end

  def destroy
    @entry = Entry.find_by_id(params[:id])
    @entry.destroy
    redirect_to entries_path, :notice => "#{@entry.title} has been deleted"
  end
end
