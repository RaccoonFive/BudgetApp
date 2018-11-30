class IncomesController < ApplicationController
  def index
    @incomes = current_user.incomes.all
    @new_income = current_user.incomes.new
  end

  def create 
    @income = current_user.incomes.new(permited_params)
    @save_state = @income.save

    if @save_state 
      @incomes = current_user.incomes.all
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @income = current_user.incomes.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @income = current_user.incomes.find(params[:id])
    @update_state = @income.update(permited_params)

    if @update_state 
      @incomes = current_user.incomes.all
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @income = current_user.incomes.find(params[:id])
    @income.destroy

    if @income.destroyed?
      @incomes = current_user.incomes.all
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
