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

  def destroy
      @caban = Caban.find(params[:id])
      @caban.destroy
      redirect_to dashboard_path, status: :see_other
  end

  def edit
    @caban = Caban.find(params[:id])
  end

  def update
    @caban = Caban.find(params[:id])
    @caban.update(caban_params)
  end

  private

  def caban_params
    params.require(:caban).permit(:name, :description, :price, :address, photos: [])
  end
end
