class SurveyController < ApplicationController
    def index
        @surveys = Survey.all.order(created_at: :desc)
    end

    def show
        @survey = Survey.find(params[:id])
    end

    def new
        @survey = Survey.new
    end

    def edit
        @survey = Survey.find(params[:id])
    end

    def create
        @survey        = Survey.new(survey_params)
        @survey.active = true

        if @survey.save
            redirect_to @survey
        else
            render 'new'
        end
    end

    def update
        @survey = Survey.find(params[:id])

        if @survey.update(survey_params)
            redirect_to @survey
        else
            render 'edit'
        end
    end

    private
        def survey_params
            params.require(:survey).permit(:title, :description)
        end
end
