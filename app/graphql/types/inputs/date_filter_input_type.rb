# frozen_string_literal: true

class Types::Inputs::DateFilterInputType < Types::BaseInputObject
  description 'Attributes for filtering by date'
  argument :eq, ::Types::DateType, required: false
  argument :lt, ::Types::DateType, required: false
  argument :le, ::Types::DateType, required: false
  argument :ge, ::Types::DateType, required: false
  argument :gt, ::Types::DateType, required: false
end
