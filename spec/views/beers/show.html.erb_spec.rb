require 'spec_helper'

describe "beers/show" do
  before(:each) do
    @beer = assign(:beer, stub_model(Beer,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
