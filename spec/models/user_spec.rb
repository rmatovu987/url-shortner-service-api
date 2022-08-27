RSpec.describe User, type: :model do
  # Association test
  it { should have_many(:urls) }
  # Validation tests
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

end
