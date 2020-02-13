# frozen_string_literal: true

require 'rails_helper'

describe Api::DialogsController, "POST #create" do
  let(:user) { FactoryBot.create(:user, email: "testing@gmail.com", password: "test_password") }
  let!(:question) { FactoryBot.create(:question) }
  let(:source) { 0 }
  let(:target) { 1 }

  subject { post :create, params: { source: source, target: target, user: user } }

  it do
    subject
  end
end

describe Api::DialogsController, "PUT #update" do
  let(:user) { FactoryBot.create(:user, email: "testing@gmail.com", password: "test_password") }
  let!(:question) { FactoryBot.create(:question) }
  let(:original) { nil }
  let(:feedback) { nil }
  let(:user_intention) { nil }
  let(:complete) { nil }
  let(:dialog) { FactoryBot.create(:dialog, source: 0, target: 1, user: user, question: question, original: original, feedback: feedback ,user_intention: user_intention ,complete: complete ) }

  subject { post :put, params: { dialog: dialog, original: original, feedback: feedback,  user_intention: user_intention, complete: complete} }

  context "when original is given" do
    let(:original) { "I am cutting my foot nails" }

    it do
      subject
    end
  end

  context "when feedback is true" do
    let(:feedback) { true }
  end

  context "when feedback is false" do
    let(:feedback) { false }
  end

  context "when user_intention is given" do
    let(:user_intention) { "나는 발톱을 자르고 있었어" }
  end

  context "when complete is true" do
    let(:complete) { true }
  end

  context "when complete is false" do
    let(:complete) { false }
  end
end