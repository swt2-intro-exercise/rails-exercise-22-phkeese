require 'rails_helper'

describe "Edit paper page", type: :feature do
  before(:each) do
    @paper = Paper.new(
      title: "My Paper",
      venue: "HPI",
      year: 2022,
    )
    @paper.save
  end
    it "should have inputs for the paper's title, venue and year" do
      visit edit_paper_path(@paper.id
            )
      # these are the standard names given to inputs by the Rails form builder
      expect(page).to have_field('paper[title]')
      expect(page).to have_field('paper[venue]')
      expect(page).to have_field('paper[year]')
  end

  it "should update a paper entry on submit" do
    visit edit_paper_path(@paper.id)

    page.fill_in 'paper[title]', with: 'GPU Gems'
    find('input[type="submit"]').click
    @paper.reload

    expect(@paper.title).to eq("GPU Gems")
  end
end
