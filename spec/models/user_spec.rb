require 'spec_helper'

describe User, :type => :model do
  it "is has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a firstname" do
    user = FactoryGirl.build(:user, f_name: nil)
    user.valid?
    expect(user.errors[:f_name]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    user = FactoryGirl.build(:user, l_name: nil)
    user.valid?
    expect(user.errors[:l_name]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "returns a contact's full name as a string" do
    user = FactoryGirl.build(:user,
      f_name: 'Phan',
      l_name: 'Duy'
    )
    expect(user.full_name).to eq 'Phan Duy'
  end
end
