class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin]

  def index
    @events = Event.all.ordered_by_position
  end

  def admin
    @events = Event.all.ordered_by_position
  end
end
