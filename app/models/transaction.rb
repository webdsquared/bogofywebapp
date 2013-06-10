class Transaction < ActiveRecord::Base
  attr_accessible :date, :amount_spent, :amount_saved

  belongs_to :store
  belongs_to :user

  def average_savings
  	total = self.amount_spent + self.amount_saved
  	average = self.amount_saved / total
  	average * 100
  end

  
end
