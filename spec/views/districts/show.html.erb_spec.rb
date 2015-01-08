require 'spec_helper'

describe "districts/show" do
  before(:each) do
    @district = assign(:district, stub_model(District,
      :name => "Name",
      :zip => 1,
      :code => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
