Rails.application.routes.draw do
    resources :dashboard,
        :survey

    namespace :manage do
        resources :person,
            :permission,
            :default
    end

    get '/manage/person/:id/add-permission/:permission_id', to: 'manage/person#add_permission', as: 'manage_person_add_permission'
    get '/manage/person/:id/remove-permission/:permission_id', to: 'manage/person#remove_permission', as: 'manage_person_remove_permission'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
