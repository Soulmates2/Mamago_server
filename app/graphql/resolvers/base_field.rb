module Resolvers
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument
  end
end
