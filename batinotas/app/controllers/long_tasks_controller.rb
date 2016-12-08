class LongTasksController < ApplicationController
  before_action :set_long_task, only: [:show, :edit, :update, :destroy]
  before_action :set_common_stuff

  # GET /long_tasks
  def index
    @long_tasks = LongTask.all
  end

  # GET /long_tasks/1
  def show
  end

  # GET /long_tasks/new
  def new
    @long_task = LongTask.new
  end

  # GET /long_tasks/1/edit
  def edit
  end

  # POST /long_tasks
  def create
    @long_task = LongTask.new(long_task_params)

    if @long_task.save
      redirect_to @list, notice: 'Long task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /long_tasks/1
  def update
    if @long_task.update(long_task_params)
      redirect_to @list, notice: 'Long task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /long_tasks/1
  def destroy
    @long_task.destroy
    redirect_to @list, notice: 'Long task was successfully destroyed.'
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_long_task
      @long_task = LongTask.find(params[:id])
    end

    def set_common_stuff  
      @list = List.find_by(params[:id])
      @list_id = List.find_by(params[:id]).id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def long_task_params
      params.require(:long_task).permit(:description, :state, :priority, :percentage, :type, :list_id)
    end
end
