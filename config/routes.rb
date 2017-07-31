Rails.application.routes.draw do
  root 'subjects#new'
  resources :subjects
  resources :ratings
end
