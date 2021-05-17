Rails.application.routes.draw do
  resources :shorteners

  get "/:slug" => "shorteners#redirect", as: :s

  # redirect errors
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root 'shorteners#new'
end
