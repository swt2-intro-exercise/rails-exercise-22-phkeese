require 'rails_helper'

describe "Edit paper page", type: :feature do
  before(:each) do
    @paper = FactoryBot.create :paper
    @author = FactoryBot.create :author, first_name: "Aberforth"
  end
    it "should have inputs for the paper's title, venue and year" do
      visit edit_paper_path(@paper.id)

      # these are the standard names given to inputs by the Rails form builder
      expect(page).to have_field('paper[title]')
      expect(page).to have_field('paper[venue]')
      expect(page).to have_field('paper[year]')
      expect(page).to have_field('paper[author_ids][]')
  end

  it "should update a paper entry on submit" do
    visit edit_paper_path(@paper.id)

    page.fill_in 'paper[title]', with: 'GPU Gems'
    find('input[type="submit"]').click
    @paper.reload

    expect(@paper.title).to eq("GPU Gems")
  end

  it "should have a multiselect for authors" do
    visit edit_paper_path(@paper.id)

    select @author.name, from: "paper[author_ids][]"

    find('input[type="submit"]').click
    @paper.reload

    expect(@paper.authors).to include(@author)
  end
end
