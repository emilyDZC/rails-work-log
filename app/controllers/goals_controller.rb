class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)

    if @goal.save
      redirect_to goals_path, notice: 'Goal successfully created.'
    else
      flash.now.alert = 'Unable to create goal, please check the details and try again.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:goal)
  end
end