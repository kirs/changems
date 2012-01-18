Changems::Application.routes.draw do
  resources :ruby_gems, only: [:index, :show]
  resources :versions, only: [] do
    collection { get :range }
  end

  root to: 'ruby_gems#index'
end
