class HomeController < ApplicationController
  def index
  end

  def send_to_url
    url = params[:short_url]
    link = Url.find_sole_by(['short_url = ?', 'http://18.141.56.186:3000/app/'+url])
    link.clicks += 1
    link.save
    redirect_to link.original_url, allow_other_host: true
  end
end
