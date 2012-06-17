class ApiController < ApplicationController
  respond_to :json
  def getnames
    page = Page.find_by_url(params[:url])
    #create new entry if url doesn't exist yet
    if page.nil?
			new_page = Page.new
			new_page.url = params[:url]
      new_page.comment = ""
      new_page.usable = false
			new_page.save    
      page = new_page
    end
    # return data in the database
    @pages = page
    respond_to do |format|
      format.js  { render :json => @pages, :callback => params[:callback] }
    end
  end
end
