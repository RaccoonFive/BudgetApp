class ExpenseCategoriesController < ApplicationController
  def index
    @expense_categories = ExpenseCategory.all
  end

  def create
    @expense_category = ExpenseCategory.new(permited_params)
    @save_state = @expense_category.save

    if @save_state 
      @expense_categories = ExpenseCategory.all
    end

    respond_to do |format|
      format.js
    end
  end 

  private 

  def permited_params
    params.permit(:name)
  end
end
