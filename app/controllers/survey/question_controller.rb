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
            flash[:success] = 'Survey question added'
            redirect_to survey_path(@survey)
        else
            render 'new'
        end
    end

    def edit
        @question = Question.find(params[:question_id])
        @survey   = Survey.find(params[:id])
    end

    def update
        @question = Question.find(params[:question_id])
        @survey   = Survey.find(params[:id])

        if @question.update(question_params)
            flash[:success] = 'Survey question saved'
            redirect_to survey_path(@survey)
        else
            render 'edit'
        end
    end

    def destroy
        survey = Survey.find(params[:id])

        question = Question.find(params[:question_id])
        question.destroy

        flash[:danger] = 'Survey question removed'

        redirect_to survey_path(survey)
    end

    private
        def question_params
            params.require(:question).permit(:title, :question_type, :possible_answers)
        end
end
