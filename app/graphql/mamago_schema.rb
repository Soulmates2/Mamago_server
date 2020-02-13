class MamagoSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  rescue_from(ActiveRecord::RecordNotFound) { "Not found" }

  use GraphQL::Batch
end
