Rails.application.routes.draw do
  root to: 'welcome#show'
  resources :movies do
    patch :publish, on: :member
  end
end
