class StatMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.find_each do |user|
      Url.find_by_user_id(user.id) do |url|
        StatMailer.with(user: user, stat: url.clicks, name: url.name).stat_mail.deliver_now
      end
    end
  end
end
