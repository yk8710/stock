class ItemsController < ApplicationController
  before_action :authenticate_user!

  
  def search
    if params[:keyword].present?
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    else
      render :search
    end
  end
end
