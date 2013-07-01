class PeopleController < ApplicationController
  
  def show
  	@person = Person.find(params[:id])
    @relationship = Relationship.new
    @teams = @person.teams
    @teamlist = @teams.map { |t| t.id.to_s }
    @teamliststring = @teamlist.join(', ')
    @teammatesraw = Relationship.where("team_id IN (#{@teamliststring})")
      #Returns array of relationships for each instance of team_id from person teams
    @teammates = @teammatesraw.map { |t| t.person_id }
    @teammatesfinal = @teammates.uniq
    @teammatesfinalfinal = @teammatesfinal.delete_if { |t| t == @person.id }
    @finalteammates = Person.find(@teammatesfinalfinal)
  end

  def new
  	@person = Person.new
  end

  def index
  	@people = Person.all
  end

  def create
  	@person = Person.new(params[:person])
  	if @person.save
  	  flash[:success] = "Person added!"
  	  redirect_to @person
  	else
  	  render 'new'
  	end
  end
end