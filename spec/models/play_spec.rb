require 'rails_helper'

RSpec.describe Play, type: :model do
  it { is_expected.to validate_presence_of(:timer) }
  it { is_expected.to validate_presence_of(:url) }
end
