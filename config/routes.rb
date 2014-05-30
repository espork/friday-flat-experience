FridayFLatExperience::Application.routes.draw do
  resources :experiences

  get "home/index"
  
  root :to => "home#index"
 
end
