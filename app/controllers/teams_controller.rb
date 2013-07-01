class TeamsController < ApplicationController
  def new
  	@team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    @teammembers = @team.teammembers
  end

  def index
  	@teams = Team.all
  end

  def create
  	@team = Team.new(params[:team])
  	if @team.save
  	  flash[:success] = "Team added!"
  	  redirect_to teams_path
  	else
  	  render 'new'
  	end
  end

end
