require 'rails_helper'

describe "Delete paper action", type: :feature do
  before(:each) do
    @paper = Paper.new(
      title: "My Paper",
      venue: "HPI",
      year: 2022,
    )
    @paper.save
  end

  it "should delete a paper" do
    visit paper_path(@paper.id)

    expect(Paper.find(@paper.id)).to_not be_nil
    click_on "Destroy"
    expect { Paper.find(@paper.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "should decrease the paper count" do
    visit paper_path(@paper.id)

    count = Paper.count
    click_on "Destroy"
    expect(Paper.count).to be < count
  end


end
