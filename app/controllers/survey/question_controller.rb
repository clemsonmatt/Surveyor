class Survey::QuestionController < ApplicationController
    before_action :logged_in?

    def new
        @question = Question.new
        @survey   = Survey.find(params[:id])
    end

    def create
        @question = Question.new(question_params)
        @survey   = Survey.find(params[:id])

        @question.survey = @survey

        if @question.save
            redirect_to survey_path(@survey)
        else
            render 'new'
        end
    end

    private
        def question_params
            params.require(:question).permit(:title, :question_type, :possible_answers)
        end
end
