require 'rails_helper'

describe "Delete author action", type: :feature do
  it "should delete an author" do
    @author = Author.new(:first_name => "Alan", :last_name => "Turing")
    @author.save

    visit authors_path

    expect(page).to have_link("Delete", :href => delete)
  end
end
