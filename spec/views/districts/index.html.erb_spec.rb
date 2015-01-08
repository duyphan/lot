require 'spec_helper'

describe "districts/index" do
  before(:each) do
    assign(:districts, [
      stub_model(District,
        :name => "Name",
        :zip => 1,
        :code => 2
      ),
      stub_model(District,
        :name => "Name",
        :zip => 1,
        :code => 2
      )
    ])
  end

  it "renders a list of districts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
