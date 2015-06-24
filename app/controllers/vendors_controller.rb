class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all

    render :index
  end

  def show

    @vender = Vendor.find(params[:id])

  end

  def new
    @vendor = Vendor.new
  end

  def create

    @vendor = Vendor.create(create_params[:vendor])

    redirect_to market_path(@vendor.market_id)
  end

  def edit
    @vendor = Vendor.find(params[:id])

  end

  def update
    @vendor = Vendor.find(params[:vendor][:id])
    @vendor.update(create_params[:vendor])

    redirect_to market_path(@vendor.market_id)
  end

  def destroy
    @vendor = Vendor.destroy(params[:id])

    redirect_to market_path(@vendor.market_id)

  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id, :id])

  end

end
