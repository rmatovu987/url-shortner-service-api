class Url < ApplicationRecord
  belongs_to :user

  validates :original_url, presence: true, length: { minimum: 30 }
  validates :name, presence: true

  before_create :generate_short_url, :sanitize

  def generate_short_url
    rand(36 ** 8).to_s(36)
  end

  def sanitize
    original_url.strip!
    sanitize_url = original_url.downcase.gsub(%r{(https?://)|(www\.)}, '')
    "http://#{sanitize_url}"
  end
end
