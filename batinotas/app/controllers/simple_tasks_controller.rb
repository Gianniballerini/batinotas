class SimpleTasksController < ApplicationController
  before_action :set_simple_task, only: [:show, :edit, :update, :destroy]

  # GET /simple_tasks
  # GET /simple_tasks.json
  def index
    @simple_tasks = SimpleTask.all
  end

  # GET /simple_tasks/1
  # GET /simple_tasks/1.json
  def show
    @list_id = List.find_by(params[:id]).id
  end

  # GET /simple_tasks/new
  def new
    @simple_task = SimpleTask.new
  end

  # GET /simple_tasks/1/edit
  def edit
    @list = List.find_by(params[:id])
  end

  # POST /simple_tasks
  # POST /simple_tasks.json
  def create
    @simple_task = SimpleTask.new(simple_task_params)
    @list_id = List.find_by(params[:id]).id
    @list = List.find_by(params[:id])

    respond_to do |format|
      if @simple_task.save
        format.html { redirect_to @list, notice: 'Simple task was successfully created.' }
        format.json { render :show, status: :created, location: @simple_task }
      else
        format.html { render :new }
        format.json { render json: @simple_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simple_tasks/1
  # PATCH/PUT /simple_tasks/1.json
  def update
    @list = List.find_by(params[:id])
    respond_to do |format|
      if @simple_task.update(simple_task_params)
        format.html { redirect_to @list, notice: 'Simple task was successfully updated.' }
        format.json { render :show, status: :ok, location: @simple_task }
      else
        format.html { render :edit }
        format.json { render json: @simple_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_tasks/1
  # DELETE /simple_tasks/1.json
  def destroy
    @simple_task.destroy
    @list = List.find_by(params[:id])
    respond_to do |format|
      format.html { redirect_to @list, notice: 'Simple task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_task
      @simple_task = SimpleTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_task_params
      params.require(:simple_task).permit(:description, :state, :priority, :type, :list_id)
    end
end
