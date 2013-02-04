require 'spec_helper'

describe "/home/search" do
  before(:each) do
    assign(:result, Kaminari.paginate_array(FactoryGirl.create_list(:commodity, 5, :name => "text book")).page(1))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include("text book")
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
