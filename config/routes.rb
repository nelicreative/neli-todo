Rails.application.routes.draw do
  devise_for :users
  root "staticpages#home"
  get  "/section",    to: 'staticpages#section'
  get  "/detail",    to: 'staticpages#detail'
  get  "/history",    to: 'staticpages#history'
  resources :tasks, only: %i[create index new edit update] do
    member do
      patch 'task_status', to: 'task_statuses#update'
    end
    collection do
      get :search
    end
  end
end
