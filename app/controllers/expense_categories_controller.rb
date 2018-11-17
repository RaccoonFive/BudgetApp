class ExpenseCategoriesController < ApplicationController
  def index
    @expense_categories = ExpenseCategory.all
    @new_expense_category = ExpenseCategory.new
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

  def edit
    @expense_category = ExpenseCategory.find(params[:id])

    respond_to do |format|
      format.js
    end
  end 

  def update 
    @expense_category = ExpenseCategory.find(params[:id])
    @update_state = @expense_category.update(permited_params)

    if @update_state 
      @expense_categories = ExpenseCategory.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense_category = ExpenseCategory.find(params[:id])
    @expense_category.destroy

    if @expense_category.destroyed?
      @expense_categories = ExpenseCategory.all
    end

    respond_to do |format|
      format.js
    end
  end

  private 

  def permited_params
    params.require(:expense_category).permit(:name)
  end
end
