class CrewController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    sleep 5
    @crew = Crew.all
  end

  def show
    # sleep 5
    @member = Crew.find params[:id]
  end

  def update
  end

  def create

  end

  def destroy

  end
end
