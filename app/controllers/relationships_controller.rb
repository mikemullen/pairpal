class RelationshipsController < ApplicationController

  def new
  	@relationship = Relationship.new
  end

  def create
  	@relationship = Relationship.new(params[:relationship])
  	if @relationship.save
  	  flash[:success] = "Person Successfully added to Team!"
  	  redirect_to root_path
  	else
  	  render 'new'
  	end
  end
end