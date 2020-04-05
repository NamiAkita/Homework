class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save 
      flash[:notice] = "made task successflly"
      redirect_to tasks_path
    else
      flash[:notice] = "made task not successflly"
      render 'new'
    end
  end
  
  def index
    @tasks = Task.all.order(created_at: :desc)
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
