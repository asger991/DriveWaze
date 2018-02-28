class SpotController < ApplicationController
  before_action :set_spot, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    # shows current user spots -- @spots = current_user.spots
    @spots = Spot.all # shows all user spots

  end

  def new
    @spot = current_user.spots.build
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      redirect_to listing_spot_path(@spot), notice: "Saved..."
    else
      render :new, notice: "Something went wrong..."
    end
  end

  def listing
  end

  def show
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def location
  end

  def update
    if @spot.update(spot_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:zip, :city, :street, :description, :price, :image)
  end
end
