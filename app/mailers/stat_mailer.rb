class StatMailer < ApplicationMailer

  def stat_mail
    @user = params[:user]
    @stat = params[:stat]
    @name = params[:name]
    mail(to: @user.email, subject: "Click stat update")
  end
end
