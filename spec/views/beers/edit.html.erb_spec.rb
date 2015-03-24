require 'spec_helper'

describe "beers/edit" do
  before(:each) do
    @beer = assign(:beer, stub_model(Beer,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit beer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beer_path(@beer), "post" do
      assert_select "input#beer_title[name=?]", "beer[title]"
      assert_select "textarea#beer_content[name=?]", "beer[content]"
    end
  end
end
