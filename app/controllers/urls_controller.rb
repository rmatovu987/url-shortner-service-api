class UrlsController < ApplicationController
  def index

    @urls = Url.where(user_id: current_user.id)
    Rails.logger.info { @urls }
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.clicks = 0
    @url.short_url = "http://localhost:3000/app/#{@url.generate_short_url}"
    @url.original_url = @url.sanitize
    if @url.save
    else
      flash[:error] = @url.errors.full_messages

    end
  end

  private def url_params
    params.require(:url).permit(:name, :original_url, :user_id)
  end
end
