# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users
  get 'users/show' => 'users#show'
  root 'seq#input'
  get '/input' => 'seq#input'
  post '/show' => 'seq#show'
end
