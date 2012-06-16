class ApiController < ApplicationController
  respond_to :json
  def getnames
    @names = Name.first
    respond_to do |format|
      format.js  { render :json => @names, :callback => params[:callback] }
    end
  end
end
