require 'rails_helper'

RSpec.describe "authors index page", type: :feature do
  it "should contain a HTML table with the headings 'Name' and 'Homepage'" do
    visit authors_path
    expect(page).to have_css("table")
    within "table" do
      expect(page).to have_text("First Name")
      expect(page).to have_text("Last Name")
      expect(page).to have_text("Homepage")
    end
  end

  it "should contain a link to add new authors" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end

  # The overview page should contain an HTML table with the headings "Name" and "Homepage",
  # listing the full names as well as homepages of authors and should link to individual author's detail pages.
  # The page should also contain a link to add new authors.
end
