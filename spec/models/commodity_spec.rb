require 'spec_helper'

describe Commodity do
  it "search title by keywords" do
    book1 = Commodity.create!(:name => "book1", :num => 10, :desc => "rails book", :price => 100, :user_id => 1)
    book2 = Commodity.create!(:name => "book2", :num => 10, :desc => "rails book", :price => 100, :user_id => 1)
    expect(Commodity.search(["book1", "book2"])).to eq([book1, book2])
    expect(Commodity.search("book2")).to eq([book2])
    expect(Commodity.search(["nokeyword"])).to be_empty
  end
end
