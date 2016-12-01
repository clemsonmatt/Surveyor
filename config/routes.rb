Rails.application.routes.draw do
  get 'client/index'

    resources :dashboard,
        :survey,
        :sessions,
        :client

    namespace :manage do
        resources :person,
            :permission,
            :default
    end

    get '/manage/person/:id/add-permission/:permission_id', to: 'manage/person#add_permission', as: 'manage_person_add_permission'
    get '/manage/person/:id/remove-permission/:permission_id', to: 'manage/person#remove_permission', as: 'manage_person_remove_permission'

    # session
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
