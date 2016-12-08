class TemporalTasksController < ApplicationController
  before_action :set_temporal_task, only: [:show, :edit, :update, :destroy]
  before_action :set_common_stuff

  # GET /temporal_tasks
  def index
    @temporal_tasks = TemporalTask.all
  end

  # GET /temporal_tasks/1
  def show
  end

  # GET /temporal_tasks/new
  def new
    @temporal_task = TemporalTask.new
  end

  # GET /temporal_tasks/1/edit
  def edit
  end

  # POST /temporal_tasks
  def create
    @temporal_task = TemporalTask.new(temporal_task_params)
    if @temporal_task.save
      redirect_to @list, notice: 'Temporal task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /temporal_tasks/1
  def update
    if @temporal_task.update(temporal_task_params)
      redirect_to @list, notice: 'Temporal task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /temporal_tasks/1
  def destroy
    @temporal_task.destroy
    redirect_to @list, notice: 'Temporal task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temporal_task
      @temporal_task = TemporalTask.find(params[:id])
    end

    def set_common_stuff  
      @list = List.find_by(params[:id])
      @list_id = List.find_by(params[:id]).id
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def temporal_task_params
      params.require(:temporal_task).permit(:description, :state, :priority, :valid_from, :valid_until, :type, :list_id)
    end
end
