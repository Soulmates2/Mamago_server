# frozen_string_literal: true

class DialogSerializer < ActiveModel::Serializer
  attributes :id, :source, :target, :user_id, :complete, :feedback, :question_id, :original, :translated, :comprehended, :user_intention, :user_intention_translated, :created_at, :updated_at
end