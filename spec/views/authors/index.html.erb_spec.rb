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

  it "should contain names, homepages and a link to each author's detail and edit page" do
    @author1 = Author.new(:first_name => "Alan", :last_name => "Turing", :homepage => "example.org")
    @author1.save

    visit authors_path

    expect(page).to have_css("table")
    within "table" do
      Author.all.each do |author|
        expect(page).to have_text(author.first_name)
        expect(page).to have_text(author.last_name)
        expect(page).to have_text(author.homepage)

        expect(page).to have_link("Show", :href => author_path(author.id))
        expect(page).to have_link("Edit", :href => edit_author_path(author.id))
      end
    end
  end
end
