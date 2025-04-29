# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :residences do
        resources :items
      end
    end
  end
end
