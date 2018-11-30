class ExpensesController < ApplicationController
  def index
    @expenses = current_user.expenses.all
    @new_expense = current_user.expenses.new
    @expense_categories = current_user.expense_categories.all
  end

  def create 
    @expense = current_user.expenses.new(permited_params)
    @save_state = @expense.save

    if @save_state 
      @expenses = current_user.expenses.all
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
    @expense_categories = current_user.expense_categories.all

    respond_to do |format|
      format.js
    end
  end

  def update
    @expense = current_user.expenses.find(params[:id])
    @update_state = @expense.update(permited_params)

    if @update_state 
      @expenses = current_user.expenses.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy

    if @expense.destroyed?
      @expenses = current_user.expenses.all
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
