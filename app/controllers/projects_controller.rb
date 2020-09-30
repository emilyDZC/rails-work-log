class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project successfully created.'
    else
      flash.now.alert = 'Unable to create project, please check the details and try again.'
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(project), notice: 'Project successfully updated.'
    else
      flash.now.alert = 'Unable to update project, please check the details and try again.'
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :url, :image)
  end
end