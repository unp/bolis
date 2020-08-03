class PagesController < ApplicationController
  def index
    @events = Event.all.ordered_by_position
  end
end
