Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
