class TasksController < ApplicationController
  before_action :get_project
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /tasks or /tasks.json
  def index
    @tasks = @project.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    authorize @task
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.build

  end

  # GET /tasks/1/edit
  def edit
    authorize @task
  end

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path(@project), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_task_path(@project), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_tasks_path(@project), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    def get_project
      @project = Project.find(params[:project_id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
     # @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :start_time, :end_time, :project_id)
    end
end
