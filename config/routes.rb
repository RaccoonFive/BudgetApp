Rails.application.routes.draw do
  devise_for :users
  
  resources :incomes
  resources :expenses
  resources :expense_categories

  root to: "dashboard#index"
end
