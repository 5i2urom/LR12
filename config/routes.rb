# frozen_string_literal: true

Rails.application.routes.draw do
  root 'seq#input'
  get '/input' => 'seq#input'
  post '/show' => 'seq#show'
end
