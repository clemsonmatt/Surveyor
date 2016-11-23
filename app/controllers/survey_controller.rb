class SurveyController < ApplicationController
    def index
        @surveys = Survey.all.order(start_date: :asc)
    end

    def show
        @survey = Survey.find(params[:id])
    end

    def new
        @survey = Survey.new
    end

    def create
        @survey        = Survey.new(survey_params)
        @survey.status = 'created'

        if @survey.save
            redirect_to @survey
        else
            render 'new'
        end
    end

    private
        def survey_params
            params.require(:survey).permit(:title, :description, :start_date, :end_date)
        end
end
