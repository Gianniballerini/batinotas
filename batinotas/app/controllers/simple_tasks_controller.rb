class SimpleTasksController < ApplicationController
  before_action :set_simple_task, only: [:show, :edit, :update, :destroy]
  before_action :set_common_stuff

  # GET /simple_tasks
  def index
    @simple_tasks = SimpleTask.all
  end

  # GET /simple_tasks/1
  def show
  end

  # GET /simple_tasks/new
  def new
    @simple_task = SimpleTask.new
  end

  # GET /simple_tasks/1/edit
  def edit
  end

  # POST /simple_tasks
  def create
    @simple_task = SimpleTask.new(simple_task_params)

    if @simple_task.save
      redirect_to @list, notice: 'Simple task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /simple_tasks/1
  def update
    if @simple_task.update(simple_task_params)
      redirect_to @list, notice: 'Simple task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /simple_tasks/1
  def destroy
    @simple_task.destroy
    redirect_to @list, notice: 'Simple task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_task
      @simple_task = SimpleTask.find(params[:id])
    end

    def set_common_stuff  
      @list = List.find_by(params[:id])
      @list_id = List.find_by(params[:id]).id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_task_params
      params.require(:simple_task).permit(:description, :state, :priority, :type, :list_id)
    end
end
