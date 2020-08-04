class DonationsController < ApplicationController
  before_action :redirect_cancel, only: [:create]

  def new
    @event = Event.find(params[:id])
    @donation = Donation.new(amount: @event.min_donation_amount)
  end

  def create
    @donation = Donation.new(donation_params)
    if @donation.event_slot
      @event = @donation.event_slot.event
      @donation.amount ||= @donation.event_slot.min_donation_amount
    end
    if @donation.save
      render "donations/confirm"
    else
      render "donations/new"
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
