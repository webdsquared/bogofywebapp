class PagesController < ApplicationController
  def home
  	if user_signed_in?
  	@user = current_user
  	@transactions = @user.transactions.order("date DESC").limit(10)
  	@notes = @user.notes.order("created_at DESC")
  	end
  end
end
