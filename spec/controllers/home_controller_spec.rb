# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do
  describe "GET index" do
    it "has no null instance" do
      get :index

      expect(assigns(:populars)).to_not eq(nil)
      expect(assigns(:categories)).to_not eq(nil)
      expect(assigns(:schools)).to_not eq(nil)
    end

    it "assigns all populars to @populars" do
      popular = FactoryGirl.create(:popular)
      get :index
      expect(assigns(:populars)).to eq([popular])
    end

    it "assigns all categories to @categories" do
      category = FactoryGirl.create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "assigns all shools to @schools" do
      school = FactoryGirl.create(:school)
      get :index
      expect(assigns(:schools)).to eq([school])
    end

    it "get new commodities" do
      commodities = FactoryGirl.create_list(:commodity, 20)
      get :index
      expect(assigns(:new).length).to be < 20
    end
  end

  describe "GET search" do
    it "can search iterm" do
      pending("search")
    end
  end
end
