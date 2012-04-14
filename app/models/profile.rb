# -*- coding: utf-8 -*-
class Profile < ActiveRecord::Base
  validates_presence_of :user_id
  validates_length_of :name, :in => (2..20)
  validates_each :mail, :allow_nil => false do |record, attr, value|
    if !(value =~ /^.+@.+$/)
      record.errors.add attr, ":正しいメールアドレスを入力してください"
    end
  end

  belongs_to :user
end
