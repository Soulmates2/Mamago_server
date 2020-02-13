class Types::Inputs::DateTimeFilterInputType < Types::BaseInputObject
  description "Attributes for filtering by date"
  argument :eq, GraphQL::Types::ISO8601DateTime, required: false
  argument :lt, GraphQL::Types::ISO8601DateTime, required: false
  argument :le, GraphQL::Types::ISO8601DateTime, required: false
  argument :ge, GraphQL::Types::ISO8601DateTime, required: false
  argument :gt, GraphQL::Types::ISO8601DateTime, required: false
end

