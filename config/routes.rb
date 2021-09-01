Rails.application.routes.draw do
  resources :scores
  resources :oenologists
  resources :job_titles
  resources :magazines
  devise_for :users
  resources :wine_strains
  resources :strains
  resources :wines
  get 'scores/:wine_id', to: 'scores#new', as: 'wine_scores'
  root to: "wines#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
