require 'spec_helper'


describe "upload with image" do
  it "does something" do
    visit "/beers"
    click_link "New Beer"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    

  end 
end

describe "upload without image" do
  it "does something" do
    visit "/users/sign_up"
    fill_in "Username", with: "beerman65"
    fill_in "Email", with: "tester@tester.com"
    fill_in "Password", with: "letmein1"
    fill_in "Password confirmation", with: "letmein1"
    click_button "Sign up"
    
    visit "/beers/new"
  
    fill_in "Title", with: "Lagunitas"
    fill_in "Content", with: "This is one of the Bay Area's finest beers"

    click_button "Beer Me"
    
    expect(page).to have_content("Image can't be blank")
    
    

  end 
end


describe "signing up" do
  it "signs up" do
    visit "/users/sign_up"
    fill_in "Username", with: "beerman65"
    fill_in "Email", with: "tester@tester.com"
    fill_in "Password", with: "letmein1"
    fill_in "Password confirmation", with: "letmein1"
    
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
    
    click_link "Sign In"
    fill_in "Username", with: "beerman65"
    fill_in "Password", with: "letmein1"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
   
    visit "/beers/new"
  
    fill_in "Title", with: "Lagunitas"
    fill_in "Content", with: "This is one of the Bay Area's finest beers"

    click_button "Beer Me"
    
    visit "/beers"
    click_link "down"
    expect(page).to have_content("thanks for the vote")
    
  end 
end




=begin
describe "Posting a beer" do
  def create_beer(options={})
    options[:title] ||= "Lagunitas"
    options[:content] ||= "This is one of the Bay Area's finest beer."
    
    visit "/beers"
    click_link "New Beer"
    #expect(page).to have_content("New beer")
    
    fill_in "Title", with: options[:title]
    fill_in "Content", with: options[:content]
    click_button "Create Beer"
  end
    
it "posting beer" do
  create_beer
  expect(page).to have_content("This is one of the Bay Area's finest beer.")
end


  it "displays error without title" do
    expect(Beer.count).to eq(0)
    create_beer title: ""
    
    expect(page).to have_content("too short")
    expect(Beer.count).to eq(0)
    
    visit "/beers"
    expect(page).to_not have_content("bad brew")
  end
  
  it "displays error when title is < 3 char" do
   # expect(Beer.count).to eq(0)
    create_beer title: "hi"
    
    expect(page).to have_content("too short")
    expect(beer.count).to eq(0)
    
    visit "/beers"
    expect(page).to_not have_content("bad brew")
  end
  
  it "displays error when description is < 3 char" do
    expect(Beer.count).to eq(0)
    create_beer content: "be"
    fill_in "Title", with: "Beer is yummy"
    fill_in "Content", with: "be"
    click_button "Create Beer"
    
    expect(page).to have_content("too short")
    expect(Beer.count).to eq(0)
    
    visit "/beers"
    expect(page).to_not have_content("bad brew")
  end
end

=end
