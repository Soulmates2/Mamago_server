# frozen_string_literal: true

module ApplicationHelper
  def json_response(meta:, data: nil)
    {
      meta: meta,
      data: data
    }
  end
end
