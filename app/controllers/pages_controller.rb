class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin]

  def index
    @events = Event.all.not_archived.ordered_by_position
    @site = Site.first
  end

  def admin
    @events = Event.all.ordered_by_position
    @site = Site.first
  end
end
