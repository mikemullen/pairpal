class PeopleController < ApplicationController
  
  def show
  	@person = Person.find(params[:id])
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
