Rails.application.routes.draw do
  get 'sessions/new'
  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only:[:create, :destroy, :new]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :feeds do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
