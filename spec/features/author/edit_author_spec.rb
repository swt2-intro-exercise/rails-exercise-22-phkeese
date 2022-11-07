require 'rails_helper'

describe "Edit author page", type: :feature do
    it "should have inputs for the author's first name, last name and homepage" do
      @author = Author.new(:first_name => "Alan", :last_name => "Turing")
      @author.save

      visit edit_author_path(@author.id)
      # these are the standard names given to inputs by the Rails form builder
      expect(page).to have_field('author[first_name]')
      expect(page).to have_field('author[last_name]')
      expect(page).to have_field('author[homepage]')
  end

  it "should update an author entry on submit" do
    @author = Author.new(:first_name => "Alan", :last_name => "Turing")
    @author.save

    visit edit_author_path(@author.id)

    page.fill_in 'author[first_name]', with: 'Bob'
    find('input[type="submit"]').click
    @author.reload

    expect(@author.first_name).to eq("Bob")
  end
end
