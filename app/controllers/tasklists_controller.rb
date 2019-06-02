class TasklistsController < ApplicationController
  def index
    @tasks = Tasklist.all
  end
  
  def create
    @task = Tasklist.new(task_params)
    if @task.save
      flash[:success] = "正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def new
    @task = Tasklist.new
  end
  
  def edit
    @task = Tasklist.find(params[:id])
  end
  
  def show
    @task = Tasklist.find(params[:id])
  end
  
  def update
    @task = Tasklist.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "正常に更新されました"
      redirect_to @task
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task = Tasklist.find(params[:id])
    @task.destroy
    
    flash[:success] = "正常に削除されました"
    redirect_to tasklists_url
  end
  
end

private

def task_params
  params.require(:tasklist).permit(:content)
end

