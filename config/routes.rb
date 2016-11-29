Rails.application.routes.draw do
    resources :dashboard,
        :survey

    namespace :manage do
        resources :person
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
