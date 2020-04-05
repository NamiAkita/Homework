class AnswersController < ApplicationController
  # def new
  #   @question = Question.find_by(id: params[:question_id])
  #   @answer= Answer.new
  # end
  
  def create
     @answer = Answer.new(answer_params)
        if @answer.save
            flash[:notice] = "回答しました"
            redirect_to question_path(@answer.question_id)
        else
          # questions/showに戻る
            flash[:notice] = "回答できませんでした"
            redirect_back(fallback_location: root_path)
        end
  end
  
  def index
    @questions = Question.all.order(created_at: :desc)
    @answers = Answer.all.order(created_at: :desc)
  end
  
  private
    def answer_params
      params.require(:answer).permit(:question_id, :reply, :user_id).merge(user_id: current_user.id)
    end
  
end
