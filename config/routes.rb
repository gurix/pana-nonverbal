Rails.application.routes.draw do
  root 'subjects#new'
  resources :subjects
end
