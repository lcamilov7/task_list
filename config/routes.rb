Rails.application.routes.draw do
  resource :example, constraints: -> { Rails.env.development? }
  root "tasks#index"
  resources :tasks
end
