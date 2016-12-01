Rails.application.routes.draw do
  namespace :survey do
    get 'question/new'
  end

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

    # manage
    get '/manage/person/:id/add-permission/:permission_id', to: 'manage/person#add_permission', as: 'manage_person_add_permission'
    get '/manage/person/:id/remove-permission/:permission_id', to: 'manage/person#remove_permission', as: 'manage_person_remove_permission'

    # survey
    get '/survey/:id/preview', to: 'survey#preview', as: 'survey_preview'
    
        # questions
        get '/survey/:id/question/new', to: 'survey/question#new', as: 'new_survey_question'
        post '/survey/:id/question', to: 'survey/question#create'
        get '/survey/:id/question/:question_id/edit', to: 'survey/question#edit', as: 'edit_survey_question'
        patch '/survey/:id/question/:question_id', to: 'survey/question#update'
        delete '/survey/:id/question/:question_id', to: 'survey/question#destroy', as: 'survey_question'

    # session
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
