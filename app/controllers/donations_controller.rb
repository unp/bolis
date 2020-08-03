class DonationsController < ApplicationController
  before_action :redirect_cancel, only: [:create]
  def create
    @donation = Donation.new(donation_params)
    @event = @donation.event_slot.event if @donation.event_slot
    if @donation.save
      redirect_to root_path
    else
      render "events/open_slots"
    end
  end

  private

  def donation_params
    params.require(:donation).permit(
      :name, :email, :phone, :amount, :event_slot_id
    )
  end

  def redirect_cancel
    redirect_to root_path if params[:cancel]
  end
end
