class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.csv { send_data @events.to_csv, filename: "events-#{Date.today}.csv" }
    end
  end

  def new
    @event = Event.new(site_id: params.require(:site))
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_path
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_path
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to admin_path
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :donation_type,
      :position,
      :times,
      :min_donation_amount,
      :max_sign_ups,
      :prime_eligible,
      :archived,
      :site_id)
  end
end
