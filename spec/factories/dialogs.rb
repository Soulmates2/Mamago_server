# frozen_string_literal: true

FactoryBot.define do
  factory :dialog do
    source { 0 }
    target { 1 }
    user { FactoryBot.create(:user) }
    complete { false }
    feedback { false }
    original { LiterateRandomizer.sentence }
    translated {}
    comprehanded {}
    user_intention {}
    user_intention_translated {}
  end
end
