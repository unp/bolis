class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin]

  def index
    @sites = Site.all
  end

  def admin
    @sites = Site.all
  end
end
