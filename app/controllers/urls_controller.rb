class UrlsController < ApplicationController
  def index
    @urls = Url.where(user_id: current_user.id)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.clicks = 0
    @url.user_id = current_user.id
    @url.short_url = "http://18.141.56.186:3000/app/#{@url.generate_short_url}"
    @url.original_url = @url.sanitize
    if @url.save
    else
      flash[:error] = @url.errors.full_messages

    end
  end

  private def url_params
    params.require(:url).permit(:name, :original_url)
  end
end
