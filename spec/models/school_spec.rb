# -*- coding: utf-8 -*-
require 'spec_helper'

describe School do
  before :each do
    @s1 = School.create!(name: 'tsukuba u', city: 'tsuskuba', region: '関東')
    @s2 = School.create!(name: 'tokyo u', city: 'tokyo', region: '関東')
    @s3 = School.create!(name: 'kyoto u', city: 'kyoto', region: '関西')
  end

  it 'can get all regions' do
    expect(School.regions).to eq([@s1.region, @s3.region])
  end

  it "can get region's school" do
    expect(School.region('関東')).to eq([@s1, @s2])
  end
end
