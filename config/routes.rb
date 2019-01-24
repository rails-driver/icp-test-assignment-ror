Rails.application.routes.draw do
  resources :contacts do
    member do
      post :company, action: :assign_company
    end
  end
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
