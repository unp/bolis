class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin]

  def index
    @sites = Site.all
  end

  def pratishtha
    @site = Site.find(1)
    render "site"
  end

  def sattarbhedi
    @site = Site.find(2)
    render "site"
  end

  def abhishek
    @site = Site.find(3)
    render "site"
  end

  def patla
    @site = Site.find(4)
    render "site"
  end

  def admin
    @sites = Site.all
  end
end
