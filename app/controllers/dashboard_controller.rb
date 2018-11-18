class DashboardController < ApplicationController
  def index
    @expense_category_count = ExpenseCategory.count
    @expense_sum = Expense.all.sum(:amount)
    @income_sum = Income.all.sum(:amount)
    @balance = @income_sum - @expense_sum
    @expense_categories = ExpenseCategory.all
  end
end
