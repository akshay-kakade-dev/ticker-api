Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sheet_uploads, only: :create

  resource :share_chart, only: :show
end
