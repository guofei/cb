require 'spec_helper'

describe "/home/search" do
  before(:each) do
    assign(:result, Kaminari.paginate_array(FactoryGirl.create_list(:commodity, 10)).page(1))
  end

  it "renders attributes in <p>" do
    render
    pending("search view")
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
