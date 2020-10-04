class SitesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to admin_path
    else
      render "edit"
    end
  end

  private

  def site_params
    params.require(:site).permit(:title, :description)
  end
end
