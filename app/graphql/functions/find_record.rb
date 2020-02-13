module Functions
  class FindRecord < Base
    def initialize(model:, type:)
      @model = model
      @type = type
    end

    argument :id, GraphQL::ID_TYPE

    def call(obj, args, ctx)
      @model.find(args.id)
    end
  end
end
