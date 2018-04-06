Rails.application.routes.draw do
  root to: 'application#welcome'

  devise_for :users, defaults: { format: :json }
end
