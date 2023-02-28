class CabansController < ApplicationController
  def index
    @cabans = Caban.all
  end

  def show
    @caban = Caban.find(params[:id])
  end

  def new
    @caban = Caban.new
  end

  def create
    @caban = Caban.new(caban_params)
    @caban.user = current_user
    if @caban.save
      redirect_to caban_path(@caban)
    else
      render :new
    end
  end

  private

  def caban_params
    params.require(:caban).permit(:name, :description, :price, :address, photos: [])
  end
end
