class SurveyController < ApplicationController
    before_action :logged_in?

    def index
        @surveys = Survey.all.where(person: @user).order(created_at: :desc)
    end

    def show
        @survey = Survey.find(params[:id])
    end

    def new
        @survey = Survey.new
    end

    def create
        @survey        = Survey.new(survey_params)
        @survey.active = true
        @survey.person = @user

        if @survey.save
            flash[:success] = 'Survey added'
            redirect_to @survey
        else
            render 'new'
        end
    end

    def edit
        @survey = Survey.find(params[:id])
    end

    def update
        @survey = Survey.find(params[:id])

        if @survey.update(survey_params)
            flash[:success] = 'Survey saved'
            redirect_to @survey
        else
            render 'edit'
        end
    end

    def destroy
        survey   = Survey.find(params[:id])
        survey.destroy

        flash[:danger] = 'Survey removed'

        redirect_to survey_index_path
    end

    private
        def survey_params
            params.require(:survey).permit(:title, :description)
        end
end
