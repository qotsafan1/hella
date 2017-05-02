Rails.application.routes.draw do
  get 'post_results/add'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'index#index'
    get '/news', to: 'index#news'
    get '/results', to: 'index#results'
    get '/info', to: 'index#info'
    get '/children', to: 'index#children'
    get '/articles/:id', to: 'articles#show', as: 'article'
    post '/add', to: 'post_results#add'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
