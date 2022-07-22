class DonationsController < ApplicationController
  before_action :redirect_cancel, only: [:create]
  before_action :authenticate_user!, only: [:index]

  def index
    @donations = Donation.all
    respond_to do |format|
      format.html
      format.csv { send_data @donations.to_csv, filename: "donations-#{Date.today}.csv" }
    end
  end

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

  def destroy
    @donation = Donation.find(params[:id])
    if @donation.destroy
      redirect_to admin_path
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
