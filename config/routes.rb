Rails.application.routes.draw do
  # if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # end

  namespace :api do
    resources :users
    resources :events
    resources :attendings
    resources :messages

    resources :video_tokens, only: :create

  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

end
