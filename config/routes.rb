Rails.application.routes.draw do
  devise_for :users
  resources :job_adverts
  resources :job_applications
end
