require 'rails_helper'

RSpec.describe "papers/index", type: :feature do
  before(:each) do
    @paper = FactoryBot.create :paper
  end

  it "renders all papers if no year is specified" do
    visit papers_path
    expect(page).to have_text @paper.title
  end

  it "renders only papers from that year if specified" do
    visit papers_path(year: @paper.year + 1)
    expect(page).not_to have_text @paper.title
  end


end
