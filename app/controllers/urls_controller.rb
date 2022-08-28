class UrlsController < ApplicationController
  def index
    urls = Url.where(user_id: current_user.id)

    render json: { data: urls, message: 'Urls fetched successfully'}, status: 200
  end

  def new
    url = Url.new
  end

  def create
    url = Url.new(url_params)
    url.clicks = 0
    url.user_id = current_user.id
    url.short_url = "http://18.141.56.186/url/#{url.generate_short_url}"
    url.original_url = url.sanitize
    if url.save
      render json: { message: 'Url shortened successfully!' }, status: 200
    else
      render json: { errors: url.errors.full_messages }, status: 406
    end
  end

  private def url_params
    params.require(:url).permit(:name, :original_url)
  end
end
