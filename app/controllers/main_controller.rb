# frozen_string_literal: true

class MainController < ApplicationController
  def index
    render json: json_response(meta: { code: 200 }, data: 'hello world!')
  end
end
