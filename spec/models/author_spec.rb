require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have a first name" do
    author = Author.new(:first_name => "Alan")
    expect(author.first_name).to eq("Alan")
  end
  
  it "should have a last name" do
    author = Author.new(:last_name => "Turing")
    expect(author.last_name).to eq("Turing")
  end
  
  it "should have a homepage" do
    author = Author.new(:homepage => "http://wikipedia.org/Alan_Turing")
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "should have a method name to get the full name as string" do
    author = Author.new(:first_name => "Alan", :last_name => "Turing")
    expect(author.name).to eq("Alan Turing")
  end

end
