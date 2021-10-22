Rails.application.routes.draw do
  # products
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  delete "/products/:id" => "products#destroy"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  # suppliers
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  delete "/suppliers/:id" => "suppliers#destroy"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  post "/users" => "users#create"
end
