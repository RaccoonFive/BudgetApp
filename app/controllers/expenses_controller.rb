class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @new_expense = Expense.new
    @expense_categories = ExpenseCategory.all
  end

  def create 
    @expense = Expense.new(permited_params)
    @save_state = @expense.save

    if @save_state 
      @expenses = Expense.all
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    @expense_categories = ExpenseCategory.all

    respond_to do |format|
      format.js
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @update_state = @expense.update(permited_params)

    if @update_state 
      @expenses = Expense.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    if @expense.destroyed?
      @expenses = Expense.all
    end

    respond_to do |format|
      format.js
    end
  end

  private 

  def permited_params
    params.require(:expense).permit(:name, :amount, :expense_category_id)
  end
end
