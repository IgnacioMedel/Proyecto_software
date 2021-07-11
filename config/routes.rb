Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'},
    path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :publications, only: :create
  end

  resources :publications do
    resources :comments, only: :create
  end

  resources :users do
    resources :histories, only: :create
  end
  #Show Publication para user

  get 'publications/:id/:id', to: 'publications#show_user', as: 'show_user_publications'

  # Users Read-show

  get 'users/:id', to: 'users#show', as: 'users_show'

  delete 'users/:id' , to: 'users#delete_image_attachment', as: 'delete_image_attachment_user'

  delete 'users' , to: 'users#delete_specific_user', as: 'delete_specific_user' 

  # Requests Accept-Decline

  put 'requests/:id', to: 'requests#process_request', as: 'process_request'

  # Chats

  get 'chats', to: 'chats#index', as: 'chats'

  get 'chats/:id', to: 'chats#show', as: 'chats_show'

  post 'chats/:id', to: 'chats#send_chat_request', as: 'chats_request'

  put 'chats/:id', to: 'chats#process_request', as: 'chats_request_process'

  delete 'chats/:id', to: 'chats#destroy', as: 'chats_destroy'

  #Mensajes

  post 'messages/:id', to: 'messages#create', as: 'messages_create'

  #WannaBeAdministrador

  post 'ursers/:id', to: 'wanna_be_administrators#send_admin_request', as: 'admin_request'

  put 'users', to: 'wanna_be_administrators#process_request', as: 'admin_request_process'

  post 'users/:id', to: 'wanna_be_administrators#stop_being', as: 'stop_being_admin_process'

  resources :reviews
  resources :publications
  resources :comments
  resources :messages
  resources :requests
  resources :histories
   
      # HOME
  get 'public/main', to: 'public#main', as: 'public'
  get 'public/contact', to: 'public#contact', as: 'contact'
  root to: 'public#main'
end
