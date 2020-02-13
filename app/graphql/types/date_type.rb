# frozen_string_literal: true

class Types::DateType < Types::BaseScalar
  description 'A valid Date, transported as a string'

  def self.coerce_input(input_value, _context)
    # Parse the incoming object into a `Date`
    date = begin
             input_value.to_date
           rescue ArgumentError
             raise GraphQL::CoercionError, "#{input_value} is not a valid Date"
           end
    date
  end

  def self.coerce_result(ruby_value, _context)
    # It's transported as a string, so stringify it
    ruby_value.to_s
  end
end
