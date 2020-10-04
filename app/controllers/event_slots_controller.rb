class EventSlotsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @event_slot = EventSlot.new(event: @event)
  end

  def create
    @event_slot = EventSlot.new(event_slot_params)
    if @event_slot.save
      redirect_to admin_path
    else
      render "new"
    end
  end

  def edit
    @event_slot = EventSlot.find(params[:id])
  end

  def update
    @event_slot = EventSlot.find(params[:id])
    if @event_slot.update(event_slot_params)
      redirect_to admin_path
    else
      render "edit"
    end
  end

  def destroy
    @event_slot = EventSlot.find(params[:id])
    if @event_slot.destroy
      redirect_to admin_path
    end
  end

  private

  def event_slot_params
    params.require(:event_slot).permit(:event_id, :slot_id, :min_donation_amount)
  end
end
