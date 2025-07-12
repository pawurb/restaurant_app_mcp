Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Home page
  root "application#home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Mount the MCP service
  mount RailsPgExtrasMcp::App.build(allowed_origins: [ /.*./ ], allowed_ips: [ "*" ], localhost_only: false, auth_token: ENV["PG_EXTRAS_MCP_AUTH_TOKEN"]), at: "pg_extras_mcp"
  mount RailsPgExtras::Web::Engine, at: "pg_extras"
end
