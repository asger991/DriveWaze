class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
    @spot = Spot.find(params[:spot_id])
  end

  def create
    # @user = User.find_by(username: params[:username])
    @spot = Spot.find(params[:spot_id])
    @availability = Availability.create(availablility_params)
    @availability.spot = @spot


      if @availability.save
        redirect_to dashboard_index_path
      else
        p @availability.errors.full_messages
      end
    end


  private
  def availablility_params
    params.require(:availability).permit(:start_time, :end_time, :spot_id)
  end
end