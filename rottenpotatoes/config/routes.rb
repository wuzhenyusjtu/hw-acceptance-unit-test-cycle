Rottenpotatoes::Application.routes.draw do
  # resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  resources :movies do
    member do
      get :similar
    end
  end
end
