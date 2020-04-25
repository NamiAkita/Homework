class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save 
      flash[:notice] = "課題を作成しました"
      redirect_to tasks_path
    else
      flash[:notice] = "作成できませんでした"
      render 'new'
    end
  end
  
  def index
    @tasks = Task.page(params[:page]).per(5).order(created_at: :desc)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    @url = @task.youtube.last(11)
  end
  
  private 
    def task_params
      params.require(:task).permit(:title, :content, :pdf, :audio, :youtube, :user_id).merge(user_id: current_user.id)
    end
    
end
