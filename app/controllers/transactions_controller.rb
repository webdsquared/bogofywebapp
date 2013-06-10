class TransactionsController < ApplicationController
  def index
    @user = current_user
    @transactions = @user.transactions.all
  end

  def show
    @user = current_user
    @transaction = @user.transactions.find(params[:id])
  end

  def new
    @user = current_user
    @transaction = @user.transactions.new
  end

  def create
    @user = current_user
    @transaction = @user.transactions.create(params[:transaction])
    if @transaction.save
      redirect_to root_path, :notice => "Successfully created transaction."
    else
      render :action => 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to @transaction, :notice  => "Successfully updated transaction."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_url, :notice => "Successfully destroyed transaction."
  end
end
