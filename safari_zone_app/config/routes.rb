Rails.application.routes.draw do
  root to: 'application#index'

  resources :pokemons, only: [:index, :show, :new, :create, :destroy]

  
#Index invisible list of all pokemons
#Show accesses one pokemon to be shown in the Safari Zone


  resources :trainers do
    member do
      put 'add_pokemon', as: :add_pokemon_to
      put 'remove_pokemon', as: :remove_pokemon_from
    end
  end

  #Login Routes
  get 'sessions/new' => 'sessions#new'

  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

end
