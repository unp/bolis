class SlotsController < ApplicationController
  before_action :authenticate_user!

  def index
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      redirect_to slots_path
    else
      render "new"
    end
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    @slot = Slot.find(params[:id])
    if @slot.update(slot_params)
      redirect_to slots_path
    else
      render "edit"
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    if @slot.destroy
      redirect_to slots_path
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:name, :description)
  end
end
