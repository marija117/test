Rails.application.routes.draw do
  root "job_adverts#index"

  devise_for :users
  resources :job_adverts
  resources :job_applications
end
