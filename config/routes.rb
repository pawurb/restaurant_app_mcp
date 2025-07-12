Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  mount RailsPgExtrasMcp::App.build(allowed_origins: [ /.*./ ], allowed_ips: [ "*" ], localhost_only: false), at: "pg_extras_mcp"
end
