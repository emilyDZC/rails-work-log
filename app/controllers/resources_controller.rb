class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    if @resource.save
      redirect_to resources_path, notice: 'Resource successfully created.'
    else
      flash.now.alert = 'Unable to create resource, please check the details and try again.'
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to resources_path, notice: 'Resource successfully updated.'
    else
      flash.now.alert = 'Unable to update resource, please check the details and try again.'
      render :edit
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :link, :image)
  end
end