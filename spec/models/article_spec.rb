require 'spec_helper'

describe Article, :type => :model do
  it "is has a valid factory" do
    user = FactoryGirl.create(:user)
    article = FactoryGirl.create(:article, user: user)

    expect(article).to be_valid
  end

  it "is invalid without a title" do
    user = FactoryGirl.create(:user)
    article = FactoryGirl.build(:article, user: user, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end
end
