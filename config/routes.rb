Rails.application.routes.draw do
  get '/digs/:psycotic_slug' => 'psycotic#index'
end
