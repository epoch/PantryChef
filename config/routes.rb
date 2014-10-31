GaFirstProject::Application.routes.draw do

  root 'recipes#new'

  get '/external/:id' => 'external#index', as: 'display_external'

  get '/recipe_boxes/new/:id' => 'recipe_boxes#new', as: 'save_recipe'

 	post '/recipe_boxes/add_to_box' => 'recipe_boxes#add_to_box', as: 'add_to_recipe_box'

 	post '/recipe_boxes/new_box' => 'recipe_boxes#create'

 	get '/recipe/add_note' => 'recipes#add_note'

 	post '/recipe/create_note' => 'recipes#create_note'

 	get '/recipe/edit_note' => 'recipes#edit_note'

 	get '/search' => 'recipes#search'


  resources :recipes, :recipe_boxes, :session, :users, :shopping_list

end
