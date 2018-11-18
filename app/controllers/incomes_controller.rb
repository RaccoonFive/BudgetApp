class IncomesController < ApplicationController
  def index
    @incomes = Income.all
    @new_income = Income.new
  end

  def create 
    @income = Income.new(permited_params)
    @save_state = @income.save

    if @save_state 
      @incomes = Income.all
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @income = Income.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @income = Income.find(params[:id])
    @update_state = @income.update(permited_params)

    if @update_state 
      @incomes = Income.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy

    if @income.destroyed?
      @incomes = Income.all
    end

    respond_to do |format|
      format.js
    end
  end

  private 

  def permited_params
    params.require(:income).permit(:name, :amount)
  end
end
