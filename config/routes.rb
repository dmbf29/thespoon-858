Rails.application.routes.draw do
  # CRUD
  # verb '/path', to: 'controller#action', as: :prefix
  # the prefix refers to the path only, not the http verb

  # Read All
  get '/restaurants', to: 'restaurants#index', as: :restaurants # (restaurants_path)

  # Create
  # We need a form page
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # A place to send the form info
  post '/restaurants', to: 'restaurants#create'

  # Read One
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant


  # Update
  # We need a form page
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # A place to send the form info
  patch '/restaurants/:id', to: 'restaurants#update'

  # Delete
  delete '/restaurants/:id', to: 'restaurants#destroy'
end

# link_to restaurant_path # show page
# link_to restaurant_path, method: :delete # destroy action
