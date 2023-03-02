class CabansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @cabans = policy_scope(Caban)
    if params[:query].present?
      @cabans = Caban.global_search(params[:query])
    end
    
    @markers = @cabans.geocoded.map do |caban|
      {
        lat: caban.latitude,
        lng: caban.longitude
      }
    end
  end

  def show
    @caban = Caban.find(params[:id])
    @marker = [{ lat: @caban.latitude, lng: @caban.longitude }]
    authorize @caban
  end

  def new
    @caban = Caban.new
    authorize @caban
  end

  def create
    @caban = Caban.new(caban_params)
    @caban.user = current_user
    authorize @caban
    if @caban.save
      redirect_to caban_path(@caban)
    else
      render :new
    end
  end

  def destroy
      @caban = Caban.find(params[:id])
      @caban.destroy
      authorize @caban
      redirect_to dashboard_path, status: :see_other
  end

  def edit
    @caban = Caban.find(params[:id])
    authorize @caban
  end

  def update
    @caban = Caban.find(params[:id])
    if params["caban"]["photos"] == [""]
      @caban.update(caban_params.except(:photos))
    else
      @caban.update(caban_params)
    end
    authorize @caban
    redirect_to caban_path(@caban), status: :see_other
  end

  private

  def caban_params
    params.require(:caban).permit(:name, :description, :price, :address, photos: [])
  end
end
