class TemporalTasksController < ApplicationController
  before_action :set_temporal_task, only: [:show, :edit, :update, :destroy]

  # GET /temporal_tasks
  # GET /temporal_tasks.json
  def index
    @temporal_tasks = TemporalTask.all
  end

  # GET /temporal_tasks/1
  # GET /temporal_tasks/1.json
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
  # POST /temporal_tasks.json
  def create
    @temporal_task = TemporalTask.new(temporal_task_params)
    @list = List.find_by(params[:id]).id

    respond_to do |format|
      if @temporal_task.save
        format.html { redirect_to @temporal_task, notice: 'Temporal task was successfully created.' }
        format.json { render :show, status: :created, location: @temporal_task }
      else
        format.html { render :new }
        format.json { render json: @temporal_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temporal_tasks/1
  # PATCH/PUT /temporal_tasks/1.json
  def update
    respond_to do |format|
      if @temporal_task.update(temporal_task_params)
        format.html { redirect_to @temporal_task, notice: 'Temporal task was successfully updated.' }
        format.json { render :show, status: :ok, location: @temporal_task }
      else
        format.html { render :edit }
        format.json { render json: @temporal_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporal_tasks/1
  # DELETE /temporal_tasks/1.json
  def destroy
    @temporal_task.destroy
    respond_to do |format|
      format.html { redirect_to temporal_tasks_url, notice: 'Temporal task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temporal_task
      @temporal_task = TemporalTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temporal_task_params
      params.require(:temporal_task).permit(:description, :state, :priority, :valid_from, :valid_until, :type, :list_id)
    end
end
