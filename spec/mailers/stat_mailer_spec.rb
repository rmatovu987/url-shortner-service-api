require "rails_helper"

RSpec.describe StatMailer, type: :mailer do
  def stat_mail
    StatMailer.with(user: User.all.sample, stat: 5, name: 'Finplus')
  end
end
