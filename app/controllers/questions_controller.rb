class QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page]).per(5).order(created_at: :desc)
  end
  
  def new
    @question = Question.new
  end
  def create
     @question = Question.new(question_params)
     if @question.save
       flash[:notice] = "質問しました"
       redirect_to questions_path
     else
      render 'new'
     end
  end
  
  def show
      @question = Question.find_by(id: params[:id])
      @answers = Answer.where(question_id: @question).order(created_at: :desc)
      @answer = Answer.new
  end
  
  private 
      def question_params
          params.require(:question).permit(:title, :content, :user_id,).merge(user_id: current_user.id)
      end
  
end
