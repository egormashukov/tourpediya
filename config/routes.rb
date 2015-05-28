Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :categories, only: [:show]
  resources :cities, only: [:index, :show]
  resources :excursions, only: [:update, :show] do
    patch :unview, on: :member
  end

  root to: 'cities#index'
end
