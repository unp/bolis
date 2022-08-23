class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin]

  def index
    @sites = Site.all
    if @sites.length == 1
      @site = @sites.first
      render 'sites/show', layout: "home"
    else
      render(layout: "home")
    end
  end

  def admin
    @sites = Site.all
  end
end
