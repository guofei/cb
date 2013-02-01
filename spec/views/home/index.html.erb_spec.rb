# -*- coding: utf-8 -*-
require 'spec_helper'

describe "home/index" do
  before(:each) do
    assign(:populars, [FactoryGirl.create(:popular), FactoryGirl.create(:popular)])
    assign(:categories, [FactoryGirl.create(:category), FactoryGirl.create(:category)])
    assign(:schools, [FactoryGirl.create(:school), FactoryGirl.create(:school)])
    assign(:new, FactoryGirl.create_list(:commodity, 10, :name => "text book"))
  end

  it "renders a list of homes" do
    render
    expect(rendered).to include("text book")
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
