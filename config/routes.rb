Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

  resources :cities
  resources :excursions do
    patch :unview, on: :member
  end
  resources :categories

  root to: 'cities#index'
end
