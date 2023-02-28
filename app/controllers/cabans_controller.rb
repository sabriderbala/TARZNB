class CabansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @cabans = policy_scope(Caban)
  end

  def show
    @caban = Caban.find(params[:id])
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
    @caban.update(caban_params)
    authorize @caban
    redirect_to caban_path(@caban), status: :see_other
  end

  private

  def caban_params
    params.require(:caban).permit(:name, :description, :price, :address, photos: [])
  end
end
