class CrewController < ApplicationController
  respond_to :json

  def index
    @crew = Crew.all
  end

  def show
    # sleep 5
    @member = Crew.find params[:id]
  end

  def update
    sleep 2
    @member = Crew.find params[:id]
    if @member.update_attributes crew_params
      render 'crew/show'
    else
      respond_with @member
    end
  end

  def create
    sleep 2
    @member = Crew.new
    if @member.update_attributes crew_params
      render 'crew/show'
    else
      respond_with @member
    end
  end

  def destroy
    sleep 2
    member = Crew.find params[:id]
    member.destroy()
    render json: {}
  end

  private

  def crew_params
    params.require(:crew).permit(:age, :name, :avatar, :title, :species, :origin, :quote)
  end
end
