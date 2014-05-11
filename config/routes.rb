Credify::Application.routes.draw do

  resources :tasks
  resources :users
 resources :sessions, only: [:new, :create, :destroy]
    root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/task_done', to: 'tasks#assoc', via: 'get'
  match '/task_undone', to: 'tasks#disassoc', via: 'get'
  end