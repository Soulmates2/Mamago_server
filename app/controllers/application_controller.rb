# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApplicationHelper
  include ApplicationErrorHandler
end
