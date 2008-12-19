class TasksController < ApplicationController
  
  def index 
    list
    render :action => :list
  end
  
  def list
    @tasks = Task.find :all, :include => :user
  end
  
  def new
    @task = Task.new
    @users = User.find :all
  end
    
  def create
    @task = Task.new params[:task]
    @task.save 
    redirect_to tasks_path      # переход на страницу list.html.erb
  end
  
end
