class DashboardController < ApplicationController
  def index
    @expense_category_count = current_user.expense_categories.count
    @expense_sum = current_user.expenses.sum(:amount)
    @income_sum = current_user.incomes.sum(:amount)
    @balance = @income_sum - @expense_sum
    @expense_categories = current_user.expense_categories
    
    @colors = []#

    @expense_categories.each do |category|
      @colors.push("#" + "%06x" % (rand * 0xffffff))
    end
  end
end
