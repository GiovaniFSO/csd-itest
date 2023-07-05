Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login', defaults: { format: 'json' }
    end
  end
end
