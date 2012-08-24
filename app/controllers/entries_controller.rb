class EntriesController < ApplicationController
  respond_to :html, :atom

  before_filter :authenticate_action

  def index
    @entries = Entry.order('created_at desc').paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @entry = Entry.new
  end

  def show
    @entry = Entry.find_by_slug(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      redirect_to entry_path(@entry), :notice => '#{@entry.title} has been created'
    else
      puts @entry.errors.messages.inspect
      render 'new'
    end
  end

  def edit
    @entry = Entry.find_by_slug(params[:id])
  end

  def update
    @entry = Entry.find_by_slug(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to entry_path(@entry), :notice => '#{@entry.title} has been updated'
    else
      puts @entry.errors.messages.inspect
      render 'edit'
    end
  end

  def destroy
    @entry = Entry.find_by_slug(params[:id])
    @entry.destroy
    redirect_to entries_path, :notice => '#{@entry.title} has been deleted'
  end
end