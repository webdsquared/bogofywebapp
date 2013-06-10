class NotesController < ApplicationController
  def index
    @user = current_user
    @notes = @user.notes.all
  end

  def show
    @user = current_user
    @note = @user.notes.find(params[:id])
  end

  def new
    @user = current_user
    @note = @user.notes.new
  end

  def create
    @user = current_user
    @note = @user.notes.create!(params[:note])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect_to @note, :notice  => "Successfully updated note."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_url, :notice => "Successfully destroyed note."
  end
end
