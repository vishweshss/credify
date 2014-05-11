class TasksController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
   before_action :admin_user,     only: [:destroy,:new]
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)    # Not the final implementation!
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
    end
    def show
    @task = Task.find(params[:id])
  end
def index
     @tasks = Task.paginate(page: params[:page])
  end
  def edit
     @task = Task.find(params[:id])
  end

  def delete
  end
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "Task updated"
      redirect_to @task
    else
      render 'edit'
    end
  end
def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Task deleted."
    redirect_to tasks_url
  end
  def assoc
     @user = current_user
      @task = Task.find(params[:id])
    @task.users << current_user
   redirect_to @user
  end
  def disassoc
      @user = current_user
      @task = Task.find(params[:id])
    @task.users.delete(current_user)
   redirect_to  @user
    
  end
  private
def task_params
      params.require(:task).permit(:name, :value)
    end
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
