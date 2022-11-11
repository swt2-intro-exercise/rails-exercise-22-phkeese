require 'rails_helper'

describe "Delete author action", type: :feature do
  before(:each) do
    @author = Author.new(:first_name => "Alan", :last_name => "Turing")
    @author.save
  end

  it "should delete an author" do
    visit authors_path

    expect(Author.find(@author.id)).to_not be_nil
    click_on "Delete"
    expect { Author.find(@author.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "should decrease the author count" do
    visit authors_path

    count = Author.count
    click_on "Delete"
    expect(Author.count).to be < count
  end


end
