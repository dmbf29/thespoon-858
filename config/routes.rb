Rails.application.routes.draw do
  resources :restaurants
end

# link_to restaurant_path # show page
# link_to restaurant_path, method: :delete # destroy action
