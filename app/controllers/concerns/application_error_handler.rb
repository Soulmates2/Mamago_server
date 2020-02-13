# frozen_string_literal: true

module ApplicationErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: ErrorResponse.with_status(400)
    rescue_from ApplicationError, with: ErrorResponse.with_status(403)
  end

  #
  # Class for Error Handling
  #
  class ErrorResponse
    def self.with_status(status)
      lambda { |exception|
        meta = {
          code: exception.try(:code) || status,
          error_type: exception.class.name,
          message: exception.message
        }

        render json: { meta: meta }, status: status || 400
      }
    end
  end
end
