class EventsController < ApplicationController
  def open_slots
    @event = Event.find(params[:id])
    @donation = Donation.new
  end
end
