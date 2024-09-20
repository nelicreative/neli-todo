Rails.application.routes.draw do
  devise_for :users
  root to: "staticpages#home"
  get  "/section",    to: 'staticpages#section'
  get  "/detail",    to: 'staticpages#detail'
  get  "/history",    to: 'staticpages#history'
  get 'profiles/show'
  get 'profiles/update'
  resources :tasks, only: %i[create index new edit update] do
    member do
      patch 'task_status', to: 'task_statuses#update'
    end
    collection do
      get :search
    end
  end
  resource :profile, only: %i[show update]
end
