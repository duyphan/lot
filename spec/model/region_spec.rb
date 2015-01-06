require 'spec_helper'

describe Region do
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(10) }
end