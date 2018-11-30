class ExpenseCategoriesController < ApplicationController
  def index
    @expense_categories = current_user.expense_categories.all

    puts @expense_categories.inspect

    @new_expense_category = current_user.expense_categories.new
  end

  def create
    @expense_category = current_user.expense_categories.new(permited_params)
    @save_state = @expense_category.save

    if @save_state 
      @expense_categories = current_user.expense_categories.all
    end

    respond_to do |format|
      format.js
    end
  end 

  def edit
    @expense_category = current_user.expense_categories.find(params[:id])

    respond_to do |format|
      format.js
    end
  end 

  def update 
    @expense_category = current_user.expense_categories.find(params[:id])
    @update_state = @expense_category.update(permited_params)

    if @update_state 
      @expense_categories = current_user.expense_categories.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @expense_category = current_user.expense_categories.find(params[:id])
    @expense_category.destroy

    if @expense_category.destroyed?
      @expense_categories = current_user.expense_categories.all
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
