class TransactionsController < ApplicationController
  def index
  end

  def new
    @transaction = Transaction.new
    @accounts = Account.find_all_by_user_id(current_user_id)
  end
end
