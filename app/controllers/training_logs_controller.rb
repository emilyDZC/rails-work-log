class TrainingLogsController < ApplicationController

  def index
    @training_logs = TrainingLog.all
  end

  def new
    @training_log = TrainingLog.new
  end

  def create
    @training_log = TrainingLog.create(training_log_params)
    if @training_log.save
      redirect_to training_logs_path, notice: 'Training log successfully created.'
    else
      flash.now.alert = 'Unable to create training log, please check the details and try again.'
      render :new
    end
  end

  def edit
    @training_log = TrainingLog.find(params[:id])
  end

  def update
    @training_log = TrainingLog.find(params[:id])
    if @training_log.update(training_log_params)
      redirect_to training_logs_path, notice: 'Training log successfully updated.'
    else
      flash.now.alert = 'Unable to update training log, please check the details and try again.'
      render :edit
    end
  end

  def destroy
    @training_log = TrainingLog.find(params[:id])
    @training_log.destroy
  end

  private

  def training_log_params
    params.require(:training_log).permit(:title, :description, :skills, :date, :links)
  end
end