RSpec.describe Url, type: :model do

  # Validation tests
  it { should validate_presence_of(:original_url) }
  it { should validate_presence_of(:name) }
  it {
    should validate_length_of(:original_url)
             .is_at_least(30)
  }
end
