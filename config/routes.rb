Rails.application.routes.draw do
  get 'client/index'

    resources :dashboard,
        :survey

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
