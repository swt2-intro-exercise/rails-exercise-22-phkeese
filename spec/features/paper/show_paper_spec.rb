require 'rails_helper'

describe "Show paper page", type: :feature do
  before :each do
    @paper = Paper.create!(
      title: "My Paper",
      venue: "HPI",
      year: 2022,
    )
    @author1 = FactoryBot.create :author
    @author2 = FactoryBot.create :author

    @paper.authors << @author1 << @author2
    @paper.save

    visit paper_path(@paper)
  end

  it "should show the paper's attributes" do
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  # Given a paper with an author
  # When a user visits the paper's show page
  # Then it should show the author's full name
  it "should list the authors" do
    expect(@paper.authors).to_not be_empty

    @paper.authors.each do |author|
      expect(page).to have_text(author.name)
    end
  end
end