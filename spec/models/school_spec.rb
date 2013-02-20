# -*- coding: utf-8 -*-
require 'spec_helper'

describe School do
  before :each do
    @s1 = School.create!(name: 'tsukuba u', city: 'tsuskuba', region: '関東')
    @s2 = School.create!(name: 'tokyo u', city: 'tokyo', region: '関東')
    @s3 = School.create!(name: 'kyoto u', city: 'kyoto', region: '関西')
  end

  it 'get all commodities' do
    user1 = User.create!(email: 'kk@kk.com', password: '123456')
    user1.school = @s1
    user1.save
    user2 = User.create!(email: 'kk2@kk.com', password: '123456')
    user2.school = @s1
    user2.save

    c1 = Commodity.create!(name: 'aaa', num: 2, desc: 'aaa', price: 100, user: user1, place: 'school')
    c2 = Commodity.create!(name: 'bbb', num: 2, desc: 'bbb', price: 100, user: user2, place: 'school')
    c3 = Commodity.create!(name: 'ccc', num: 2, desc: 'ccc', price: 100, user: user1, place: 'school')
    c4 = Commodity.create!(name: 'ddd', num: 2, desc: 'ddd', price: 100, user: user1, place: 'school')

    expect(@s1.commodities).to eq([c4, c3, c2, c1])
  end

  it 'can get all regions' do
    expect(School.regions).to eq([@s1.region, @s3.region])
  end

  it "can get region's school" do
    expect(School.region('関東')).to eq([@s1, @s2])
  end
end
