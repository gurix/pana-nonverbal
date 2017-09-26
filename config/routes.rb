Rails.application.routes.draw do
  root 'subjects#new'
  scope "/:locale" do
    root 'subjects#new'
    resources :subjects
    resources :ratings
  end
  resource :pages
end
