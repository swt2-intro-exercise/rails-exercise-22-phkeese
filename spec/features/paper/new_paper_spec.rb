require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end

  it "should have inputs for the paper's title, venue and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should create a new paper entry on submit" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'My Paper'
    page.fill_in 'paper[venue]', with: 'HPI'
    page.fill_in 'paper[year]', with: 2022

    find('input[type="submit"]').click

    expect(Paper.find_by(:title => "My Paper"))
  end
end
