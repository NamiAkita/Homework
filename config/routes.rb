Rails.application.routes.draw do



  get 'users/show'

  # get 'answers/new'

  devise_for :users, controllers: {
        sessions: 'users/sessions', 
        registrations: 'users/registrations'
  }
  root 'home#top'
  get "all_diaries" => "diaries#all_index"
  
  resources :tasks
  
  resources :questions, only: [:index, :new, :create, :show] do
    resources :answers, only: [:new, :create, :index, :show]
  end
  
  resources :users, only: [:index, :show] do
    resources :diaries, except: [:destroy] 
  end
  
  get 'diaries/nonsubmit' => 'diaries#nonsubmit'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
